CKEDITOR.plugins.add( 'wjpedia', {
    icons: 'wjpedia',
    init: function( editor ) {
        editor.addCommand( 'wjpedia', new CKEDITOR.dialogCommand( 'wjpediaDialog' ) ); // adding the command
        editor.ui.addButton( 'wjpedia', {
            label: '웅진학습백과 단어를 입력해주세요',    // button's tooltip text.
            command: 'wjpedia',         // the command to be executed once the button is activated.
            toolbar: 'insert, 100'   // the toolbar group into which the button will be added.
        });
        CKEDITOR.dialog.add( 'wjpediaDialog', this.path + 'dialogs/wjpedia.js' );
    }
});