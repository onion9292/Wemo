$('document').ready(function(){
	var check=0;
	//등록 버튼 클릭할 때 이벤트 부분
	$('form').submit(function(){
		
		if($.trim($("input").eq(6).val()) == ""){
			alert("비밀번호를 입력하세요");
			$("input:eq(6)").focus();
			return false;
		}
		
		if($.trim($("input").eq(4).val()) == ""){
			alert("제목을 입력하세요.");
			$("input:eq(4)").focus();
			return false;
		}
		
		if($.trim($("textarea").val()) == ""){
			alert("내용을 입력하세요");
			$("textarea").focus();
			return false;
		}
		
		if(check==0){
			value =$('#filevalue').text();
			html= "<input type='text' value='"+value+"' name='check'>";
			$(this).append(html);
		}
		
	});//submit end
	show();
	
	function show(){
		
		if($('#filevlaue').text() ==''){
			$('.remove').css('dispaly','none');
		}else{
			$('.remove').css({
				'display':'inline-block',
				'position':'relative',
				'top'	:'-5px'				
			})
		}
		
	}
	
	$("#upfile").change(function(){
		check++;
		var inputfile = $(this).val().split('\\');
		$('#filevalue').text(inputfile[inputfile.length -1]);
		show();
		
	})
	
	//remove 이미지를 클릭하면 파일명을 ''로 변경하고 remove이미지를 보이지 않게 합니다.
	
	$('.remove').click(function(){
		$('#filevalue').text('');
		$(this).css('display','none');
		
	})
	
	//등록 버튼 클릭할 때 이벤트 부분
	$('form').submit(function(){
		if($.trim($('#board_subject').val())==""){
			
			alert("제목을 입력하세요");
			$('#board_subject').focus();
			return false;
		}
		
	})
})//ready end