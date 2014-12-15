if((typeof(CKEDITOR) != "undefined")){
    CKEDITOR.editorConfig = function( config ) {
        config.language = 'en';
        config.toolbar_My = [
            { name: 'document',    items : [ 'Source', 'Maximize', 'ShowBlocks' ] },
            { name: 'clipboard',   items : [ 'Undo','Redo' ] },
            { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Subscript','Superscript','-','RemoveFormat' ] },
            { name: 'paragraph',   items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','SpecialChar', 'Format' ] },
            { name: 'links',       items : [ 'Link','Unlink'] }
        ];

        config.format_tags = 'p;h3';

        // config.toolbar_My = [
        //     { name: 'document',    items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
        //     { name: 'clipboard',   items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
        //     { name: 'editing',     items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
        //     { name: 'forms',       items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
        //     '/',
        //     { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
        //     { name: 'paragraph',   items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
        //     { name: 'links',       items : [ 'Link','Unlink','Anchor' ] },
        //     { name: 'insert',      items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak' ] },
        //     '/',
        //     { name: 'styles',      items : [ 'Styles','Format','Font','FontSize' ] },
        //     { name: 'colors',      items : [ 'TextColor','BGColor' ] },
        //     { name: 'tools',       items : [ 'Maximize', 'ShowBlocks','-','About' ] }
        // ];

        config.toolbar = 'My';
        // config.filebrowserBrowseUrl = '/ckeditor/attachments';
        // config.filebrowserUploadUrl = '/ckeditor/attachments';
        // config.filebrowserImageBrowseUrl = '/ckeditor/pictures';
        // config.filebrowserImageUploadUrl = '/ckeditor/pictures';
    };
}