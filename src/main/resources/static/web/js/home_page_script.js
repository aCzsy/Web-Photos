'use strict';

const det = document.getElementById("det");
const com = document.getElementById("com");

const image_modal_img_details_btn = document.getElementById("img_modal_img_details_btn");
const image_modal_img_comments_btn = document.getElementById("img_modal_img_comments_btn");
// const image_modal_img_details = document.querySelector('.image-modal-content-img-details');
// const image_modal_img_comments = document.querySelector('.image-modal-content-comments');

const slides = document.getElementsByClassName('slide');
let image_details_list = document.getElementsByClassName('image-modal-content-img-details');
let image_comments_list = document.getElementsByClassName('image-modal-content-comments');

const add_comment_btn = document.getElementsByClassName('add-comment-buttons');


let pre_upload = document.getElementById("pre-upload-image-modal");

function closeWindow(elementId){
    document.getElementById(elementId).style.display = "none";
}

const upl_img = document.getElementById("uploaded_image");
upl_img.addEventListener("change",function (event){
    const output = document.getElementById('pre-upload-image');
    let pre_upload = document.getElementById("pre-upload-image-modal");
    let pre_upload_title = document.getElementById("pre-upload-image-title");
    let pre_upload_ext = document.getElementById("pre-upload-image-extension");
    let pre_upload_size = document.getElementById("pre-upload-image-size");
    pre_upload.style.display = "flex";
    pre_upload.style.justifyContent = "center";
    pre_upload.style.alignItems = "center";
    output.src = URL.createObjectURL(event.target.files[0]);
    pre_upload_title.innerText = event.target.files[0].name;
    pre_upload_ext.innerText = event.target.files[0].type;
    pre_upload_size.innerText = event.target.files[0].size + " kb"
    output.onload = function() {
        URL.revokeObjectURL(output.src) // free memory
    }
})

function uploadFile(inputId,formId){
    let input = document.getElementById(inputId);
    let preview_comment = document.getElementById("image-comment");
    let preview_category = document.getElementById("category");
    let temp = document.getElementById("temp")
    let image_comment = document.getElementById("imageComment");
    let image_category = document.getElementById("imageCategory");
    image_comment.value = preview_comment.value;
    image_category.value = preview_category.value;
    //function called when file gets selected
    let selected_item = input.files[0];
    let upload_form = document.getElementById(formId);
    //submit a form if an image has a name, meaning file exists
    if(selected_item.name !== ""){
        upload_form.submit();
    }
    pre_upload.style.display = "none";
}

function showImageInfoModal(imageId, imageName, imageSize, imageExt, imgComment) {
    $('#image-info-img-id').val(imageId ? imageId : '');
    $('#image-info-img').attr("src", "/home/image/" + imageId);
    $('#image-info-img-name').val(imageName ? imageName : '');
    $('#image-info-img-size').val(imageSize ? imageSize + " kb" : '');
    $('#image-info-img-extension').val(imageExt ? imageExt : '');
    $('#image-info-img-comment').val(imgComment ? imgComment : '');
    $('#image-info-modal').css({"display": "flex","justify-content":"center","align-items":"center"});
}


function revealMenu(imageId){
    const el = document.getElementsByClassName("image-menu")[imageId-1];
    if(el.style.visibility === "hidden"){
        el.style.visibility = "visible";
    } else{
        el.style.visibility = "hidden";
    }
}

// Initializing and running showSlide() to give a lightbox a default state.

let imageList = document.getElementsByClassName('display-image');
let imageContainerLIST = document.getElementsByClassName('image-container');
let im;

let slideIndex = 0;
//showSlide(slideIndex);


console.log(slideIndex);
//Clickable content functionality

function openLightbox() {
    document.getElementById('Lightbox').style.display = 'flex';
}

function closeLightbox() {
    document.getElementById('Lightbox').style.display = 'none';
}

// New values are assigned to slideIndex.

function changeSlide(n) {
    showSlide(slideIndex += n);
}

function toSlide(n) {
    for(let i = 0;i < imageList.length;i++){
        if(imageList[i] === n){
            slideIndex = i;
            //alert("SLIDEINDEX " + slideIndex)
            showSlide(slideIndex);
        }
    }
}

image_modal_img_details_btn.addEventListener('click', function (){
    image_comments_list[slideIndex].style.display = "none";
    image_details_list[slideIndex].style.display = "flex";
})

image_modal_img_comments_btn.addEventListener('click', function (){
    image_details_list[slideIndex].style.display = "none";
    image_comments_list[slideIndex].style.display = "flex";
})

//Lightbox logic. Decides which image to show and which bottom image is active

function showSlide(n) {

    if (n > slides.length-1) {
        //slideIndex = slides.length % n;
        slideIndex = 0;
    }

    if (n < 0) {
        slideIndex = slides.length -1;
    }

    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
        image_details_list[i].style.display = "none";
        image_comments_list[i].style.display = "none";
    }

    slides[slideIndex].style.display = 'block';
    image_details_list[slideIndex].style.display = "flex";
    image_comments_list[slideIndex].style.display = "none";
}

const fo = document.getElementsByClassName('image-comment-add-form');
const comment = document.getElementsByClassName('comment');
const comment_id = document.getElementsByClassName("comment_id");
const comment_item = document.getElementsByClassName('image-modal-content-comment-outer');
const token = $("meta[name='_csrf']").attr("content");

const add_image_comment_btn = document.getElementById("msg-send-btn");
const comments_container = document.getElementsByClassName("comments_container");
const empty_state_item = document.getElementsByClassName("comments_empty_state");
const image_content_ = document.getElementsByClassName("image-modal-content-comments");
let opened_image_id;

let comments_container_;
let comment_btn;
let image_content;
let comment_index;
let empty;
function addCommentFor(buttonIndex,imageId){
    let image_comment;
    for(let i = 0;i < add_comment_btn.length;i++){
        if(add_comment_btn[i] === buttonIndex){
        }
    }
    comments_container_ = comments_container[slideIndex];
    comment_index = comment[slideIndex];
    image_comment = {
        comment : comment_index.value
    }

    const com_cont = "#comments_container" + imageId;
    //alert(com_cont);

    event.preventDefault();
    $.ajax({
        type: "POST",
        url: '/home/add-comment-to-an-image/' + imageId,//do not put the full url,you need use an absolute urlcontentType : "application/json",,
        contentType : "application/json",
        dataType: "json",
        data: JSON.stringify(image_comment),
        headers: {"X-CSRF-TOKEN" : token},
        success: function (data) {
            if(data.message !== ''){
                $(com_cont).load(" " + com_cont);
            }
        }
    });

    comment_index.value = '';
}
