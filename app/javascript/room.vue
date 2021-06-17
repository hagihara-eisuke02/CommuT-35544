<template>
    <div id="app">
        <div class="zentai">
            <div class="video-show">
                <p>Your Peer ID: <span id="my-id">{{peerId}}</span></p>
                <input v-model="calltoid" placeholder="call id">
                <button @click="makeCall" class="button--green">Call</button>
            </div>
            <video id="their-video" width="300" autoplay playsinline></video>
            <video id="my-video" muted="true" width="300" autoplay playsinline></video>
            <br />

            マイク:
            <select v-model="selectedAudio" @change="onChange">
            <option disabled value="">Please select one</option>
            <option v-for="(audio, key, index) in audios" v-bind:key="index" :value="audio.value">
                {{ audio.text }}
            </option>
            </select>

            カメラ: 
            <select v-model="selectedVideo" @change="onChange">
                <option disabled value="">Please select one</option>
                <option v-for="(video, key, index) in videos" v-bind:key="index" :value="video.value">
                    {{ video.text }}
                </option>
            </select>
        </div>
    </div>
</template>

<script>
const API_KEY = '01836c59-749a-4245-8f7a-63aeb3f96633'; 
// const Peer = require('../skyway-js');
console.log(Peer)
export default {
    data: function () {
        return {
            audios: [],
            videos: [],
            selectedAudio: '',
            selectedVideo: '',
            peerId: '',
            calltoid: '',
            localStream: {}
        }
    },
    methods: {
        onChange: function(){
            if(this.selectedAudio != '' || this.selectedVideo != ''){
                this.connectLocalCamera();
            }
        },

        connectLocalCamera: async function(){
            const constraints = {
                audio: this.selectedAudio ? { deviceId: { exact: this.selectedAudio } } : false,
                video: this.selectedVideo ? { deviceId: { exact: this.selectedVideo } } : false
            }

            const stream = await navigator.mediaDevices.getUserMedia(constraints);
            document.getElementById('my-video').srcObject = stream;
            this.localStream = stream;
        },

        makeCall: function(){
            const call = this.peer.call(this.calltoid, this.localStream);
            this.connect(call);
        },

        connect: function(call){
            call.on('stream', stream => {
                const el = document.getElementById('their-video');
                el.srcObject = stream;
                el.play();
            });
        }
    },

    created: async function(){
        console.log(API_KEY)
        this.peer = new Peer({key: '01836c59-749a-4245-8f7a-63aeb3f96633', debug: 3}); //新規にPeerオブジェクトの作成
        this.peer.on('open', () => this.peerId = this.peer.id); //PeerIDを反映
        this.peer.on('call', call => {
            call.answer(this.localStream);
            this.connect(call);
        });

        //デバイスへのアクセス
        const deviceInfos = await navigator.mediaDevices.enumerateDevices();

        //オーディオデバイスの情報を取得
        deviceInfos
        .filter(deviceInfo => deviceInfo.kind === 'audioinput')
        .map(audio => this.audios.push({text: audio.label || `Microphone ${this.audios.length + 1}`, value: audio.deviceId}));
        
        //カメラの情報を取得
        deviceInfos
        .filter(deviceInfo => deviceInfo.kind === 'videoinput')
        .map(video => this.videos.push({text: video.label || `Camera  ${this.videos.length - 1}`, value: video.deviceId}));
        console.log(this.audios, this.videos);
    }
}
</script>

<style scoped>
    p {
    font-size: 1em;
    text-align: center;
    }
</style>