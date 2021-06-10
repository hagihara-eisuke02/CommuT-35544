// const buildHTML = (XHR) => {
//   const item = XHR.response.room;
//   const html = `
//   <div class="post-room">
//     <div class="post-room-date">
//       投稿日時:${item.created_at}
//     </div>
//     <div class="post-room-content">
//       ${item.content}
//     </div>
//   </div>`;
//   return html
// }

// function chat () {
//   console.log("イベント発火");
  // const submit = document.getElementById("submit");
  // submit.addEventListener("click", (e) => {
  //   e.preventDefault();
  //   const form = document.getElementById("form");
  //   const formData = new FormData(form);
  //   const XHR = new XMLHttpRequest();
  //   XHR.open("ROOM", post_rooms_path, true);
  //   XHR.responseType = "json";
  //   XHR.send(formData);
  //   XHR.onload = () => {
  //     if (XHR.status != 200) {
  //       alert(`Error ${XHR.status}: ${XHR.statusText}`);
  //     }
  //     const list = document.getElementById("list");
  //     const formText = document.getElementById("content");
  //     list.insertAdjacentHTML("afterend", buildHTML(XHR));
  //     formText.value = "";
  //   };
  // });
// }

// window.addEventListener('load', room);