function load_tiny (locale) {
   tinyMCE.init({
     selector: "textarea.tinymce",
     language: locale,
     // language: "en",
     theme: "modern",
     file_picker_types: 'file image media',
     relative_urls: false,
     toolbar: ["attachment | styleselect | link unlink | image media table | undo redo","bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | forecolor backcolor | fullscreen preview"],
     plugins: "table,fullscreen,image,uploadimage,link,preview,autolink,advlist,lists,charmap,hr,anchor,pagebreak,searchreplace,wordcount,visualblocks,visualchars,code,insertdatetime,media,nonbreaking,save,contextmenu,directionality,paste,textcolor,colorpicker,textpattern",
     height: "500",
   });
  tinymce.editors = [];
}

/* To initialize:
  load_tiny ("<%= I18n.locale %>");
*/