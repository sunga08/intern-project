
var selectItem = [ [ '선택',''] ];

CKEDITOR.dialog.add( 'wjpediaDialog', function ( editor ) {
    return {
        title: '웅진학습백과 연관단어 링크',
        minWidth: 400,
        minHeight: 200,
        contents: [
            {
                id: 'tab-basic',
                label: 'tab-insert',
                elements: [
                    {
                        type: 'text',
                        id: 'wjpediaHeadwd',
                        label: '검색하고자 하는 표제어를 입력하세요'
                    }
                    ,{
                    	type : 'button',
                    	id : 'headwd_search',
                    	label : '단어검색',
                    	title : 'My title',
                    	onClick : function() {
                    		var codeValue = CKEDITOR.dialog.getCurrent().getContentElement('tab-basic','wjpediaHeadwd').getValue();
                    		CKEDITOR.dialog.getCurrent().getContentElement('tab-basic','headwd').clear();
                    		CKEDITOR.dialog.getCurrent().getContentElement('tab-basic','headwd').add("선택","");
                    		
                    		$.ajax({
                                type: 'GET',
                                url: "/v1.0/commonApiData",
                              	dataType: "json",
                                contentType : "application/json",
                                data: { 'searchWord' : codeValue },
                                success: function(data) {
                                    $.map(data.RESP_RESULT.SEARCH_WORD_WJPEDIA_MEAN, function(item) {
                                    	var object ={
                            				'key' : item.DICT_SEQ
                            				,'headwd' : item.HEADWD
                            				,'value' : item.HEADWD + " | " + item.HEAD_WORD_DSCR
                            			}
        	                    		CKEDITOR.dialog.getCurrent().getContentElement('tab-basic','headwd').add(object.value,JSON.stringify(object));
                                    })
                                }
                           });
                    	}
                    }
                    ,{
                    	type : 'select',
                    	id : 'headwd',
                    	label : '표제어를 선택하세요',
                    	items : selectItem,
                    	widths: [100, 200],
                    	onChange : function( api ) {
	                    	var object = JSON.parse(this.getValue())
                    		console.log(object)
                    	}
                    }
                ]
            }
        ],
        onOk: function() {
        	var headwdValue = CKEDITOR.dialog.getCurrent().getContentElement('tab-basic','wjpediaHeadwd').getValue();
            var selectValue = CKEDITOR.dialog.getCurrent().getContentElement('tab-basic','headwd').getValue(); 
			var selectObj;
			if(headwdValue == ""){
				alert("단어를 입력해 주세요");
				return false;
			}
			
			if(selectValue == ""){
				alert("연결 표제어를 선택해 주세요");
				return false;
			}else{
				selectObj = JSON.parse(selectValue)
				console.log(selectObj)
				editor.insertHtml('<a href="#" onclick="parent.fn_detailContInit('+selectObj.key+',\''+selectObj.headwd+'\')">' + headwdValue + '</a>');
			}
        }
    }
});