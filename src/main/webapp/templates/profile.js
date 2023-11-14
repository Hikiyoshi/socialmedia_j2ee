/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
var allPicture = document.getElementById('all-picture')

var userAllPicture = document.querySelector(".user-all-picture");
allPicture.addEventListener('click',function(){
    
    
        // Nếu đang ẩn, hiển thị nó bằng cách đặt "display" thành "block"
        userAllPicture.style.display = 'flex';
        userAllPost.style.display = 'none';
      
});

var allPost = document.getElementById('all-post');
var userAllPost = document.querySelector(".user-all-post");
allPost.addEventListener('click',function(){
    
  
        userAllPost.style.display = 'block';
        userAllPicture.style.display = 'none';
});

function selectListItem(element) {
    // Lấy tất cả các phần tử <li>
    var listItems = document.querySelectorAll('.profile-mid li');

    // Xóa class 'selected' từ tất cả các phần tử
    listItems.forEach(function(li) {
      li.classList.remove('selected');
    });

    // Thêm class 'selected' cho phần tử được chọn
    element.classList.add('selected');
  }


var wrapFriend = document.querySelector(".wrap-friend");
function showFriend(){
    wrapFriend.style.display= 'block'
}

function closeFriend(){
    wrapFriend.style.display='none';
}




var userSettings = document.querySelector(".user-settings");
var darkBtn = document.getElementById("dark-button");
var LoadMoreBackground =document.querySelector(".btn-LoadMore");
var friendRequests = document.querySelector(".friend-requests");
function UserSettingToggle(){
    userSettings.classList.toggle("user-setting-showup-toggle");
}
// darkBtn.onclick = function(){
//     darkBtn.classList.toggle("dark-mode-on");
// }

function darkModeON(){
    darkBtn.classList.toggle("dark-mode-on");
   document.body.classList.toggle("dark-theme");
};

function LoadMoreToggle(){
    LoadMoreBackground.classList.toggle("loadMoreToggle");
};

//function FriendRequestToggle(){
//     
//    friendRequest.classList.toggle("friend-request-showup-toggle");
//   
//};
function FriendRequestToggle() {
    friendRequests.classList.toggle("friend-request-showup-toggle");
}

