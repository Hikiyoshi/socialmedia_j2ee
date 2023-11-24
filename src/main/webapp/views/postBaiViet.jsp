<%-- 
    Document   : postBaiViet
    Created on : Nov 19, 2023, 10:07:08 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>SocialBook </title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- FontAweome CDN Link for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <link rel="stylesheet" href="/createPost/templates/post1.css" >
    
     <script>
        function chooseImage() {
    var fileInput = document.createElement("input");
    fileInput.type = "file";
    fileInput.accept = "image/*";
    
    fileInput.addEventListener("change", function () {
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                var selectedImage = document.getElementById("selectedImage");
                selectedImage.src = e.target.result;
            };
            
            reader.readAsDataURL(fileInput.files[0]);
        }
    });
    fileInput.click();
}

    function displaySelectedImage(event) {
            var input = event.target;
            var reader = new FileReader();

            reader.onload = function () {
                var image = document.getElementById('selectedImage');
                image.src = reader.result; // Đặt nguồn hình ảnh là dữ liệu đã đọc
            };

            // Đọc dữ liệu của tệp hình ảnh khi nó được chọn
            reader.readAsDataURL(input.files[0]);
        }

    </script>
    
    
      
    
  </head>
  <body>
      <%    
          String username =null;
          HttpSession s = request.getSession();
            if (s != null ) {
             username = (String) session.getAttribute("user");
             
          }
          
      %>
     
      <div class="container">
      <div class="wrapper">
        <section class="post">
          <header>Create Post</header>
          <form action="/createPost/postController" method="post" enctype="multipart/form-data" >
              <input type="hidden" name="username" value="<% if(username!=null) out.print(username);%>">
            <div class="content">
              <img src="/createPost/images/TD.jpg" alt="logo">
              <div class="details">
                
                <div class="privacy">
                  <i class="fas fa-user-friends"></i>
                  <span>Friends</span>
                  <i class="fas fa-caret-down"></i>
                </div>
              </div>
            </div>
              <textarea id="content" name="content" placeholder="Bạn đang nghĩ gì?" spellcheck="false" required ></textarea>
             
              <img id="selectedImage" style="max-width: 450px; " src="" alt="" >
            <div class="theme-emoji">
              <img src="/createPost/images/theme.svg" alt="theme">
              <img src="/createPost/images/smile.svg" alt="smile">
            </div>
            <div class="options">
              <p>Add to Your Post</p>
              <ul class="list">
                  
                  <li><div class="gallery"><input name="image" type="file" id="imageInput" onchange="displaySelectedImage(event)" alt="Submit" ">
                          <img src="/createPost/images/gallery.svg" alt="gallery"><!-- comment --></div></li>

                  <li><img src="/createPost/images/emoji.svg" alt="gallery"></li>
                <li><img src="/createPost/images/mic.svg" alt="gallery"></li>
                <li><img src="/createPost/images/more.svg" alt="gallery"></li>
              </ul>
            </div>
                  <button type="submit">Post</button>
        </form>
          
        </section>
        <section class="audience">
          <header>
            <div class="arrow-back"><i class="fas fa-arrow-left"></i></div>
            <p>Select Audience</p>
          </header>
          <div class="content">
            <p>Who can see your post?</p>
            <span>Your post will show up in News Feed, on your profile and in search results.</span>
          </div>
          <ul class="list">
            <li>
              <div class="column">
                <div class="icon"><i class="fas fa-globe-asia"></i></div>
                <div class="details">
                  <p>Public</p>
                  <span>Anyone on or off Facebook</span>
                </div>
              </div>
              <div class="radio"></div>
            </li>
            <li class="active">
              <div class="column">
                <div class="icon"><i class="fas fa-user-friends"></i></div>
                <div class="details">
                  <p>Friends</p>
                  <span>Your friends on Facebook</span>
                </div>
              </div>
              <div class="radio"></div>
            </li>
            <li>
              <div class="column">
                <div class="icon"><i class="fas fa-user"></i></div>
                <div class="details">
                  <p>Specific</p>
                  <span>Only show to some friends</span>
                </div>
              </div>
              <div class="radio"></div>
            </li>
            <li>
              <div class="column">
                <div class="icon"><i class="fas fa-lock"></i></div>
                <div class="details">
                  <p>Only me</p>
                  <span>Only you can see your post</span>
                </div>
              </div>
              <div class="radio"></div>
            </li>
            <li>
              <div class="column">
                <div class="icon"><i class="fas fa-cog"></i></div>
                <div class="details">
                  <p>Custom</p>
                  <span>Include and exclude friends</span>
                </div>
              </div>
              <div class="radio"></div>
            </li>
          </ul>
        </section>
      </div>
    </div>

  </body>
</html>

