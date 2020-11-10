if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');
    
    document.getElementById('item-image').addEventListener('change', function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      const blob1 = window.URL.createObjectURL(file);
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);

      const videoElement = document.createElement('div');
      const blobVideo = document.createElement('video');
      blobVideo.setAttribute('src', blob1);

      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);

      imageElement.appendChild(blobVideo);
      ImageList.appendChild(videoElement);

    });
  });
}