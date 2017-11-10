
var i = 0; //start index for image loop
var imageArray = [] //array to contain the images
var timeInterval = 2000; //time between image switches

imageArray[0] = 'chucky.jpg';
imageArray[1] = 'jason.jpg';
imageArray[2] = 'evildead.jpg';

function changeImg() {
    document.slide.src = imageArray[i];
    if (i < imageArray.length - 1) {
        i++;// since array starts at 0,
        //the images would be noticed as 0,1 and 2
        //but there are 
        //3 images so we check if image is last index of 2
    } else {
        i = 0; //
    }

    setTimeout("changeImg()", timeInterval);

    //want function to run every time the window loads
   
}
window.onload = changeImg;

