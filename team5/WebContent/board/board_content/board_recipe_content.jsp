<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="http://recipe1.ezmember.co.kr/static/css/bootstrap_20180417.css" />
<link rel="stylesheet" type="text/css" href="/static/css/font.css" />
<link rel="stylesheet" type="text/css"
	href="/static/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="http://recipe1.ezmember.co.kr/static/css/ez_recipe_20190221.css" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link
	href="http://recipe1.ezmember.co.kr/img/icons/apple-touch-icon.png"
	rel="apple-touch-icon" />
<link
	href="http://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-76x76.png"
	rel="apple-touch-icon" sizes="76x76" />
<link
	href="http://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-120x120.png"
	rel="apple-touch-icon" sizes="120x120" />
<link
	href="http://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-152x152.png"
	rel="apple-touch-icon" sizes="152x152" />
<link
	href="http://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-180x180.png"
	rel="apple-touch-icon" sizes="180x180" />
<link href="http://recipe1.ezmember.co.kr/img/icons/icon-hires.png"
	rel="icon" sizes="192x192" />
<link href="http://recipe1.ezmember.co.kr/img/icons/icon-normal.png"
	rel="icon" sizes="128x128" />
<script type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript"
	src="//static.criteo.net/js/ld/publishertag.js"></script>

</head>
<body>
	<div class="container sub_bg">
		<script>

    $(function() {
        $('.jq_elips2').ellipsis( {row : 2,  onlyFullWords: true} );
        $('.jq_elips').ellipsis();
    });


    function move(width, count, direction, el_id) {


        var total = width * count;

        var $el = $('#'+el_id);

        if ($el.data('state') == 'move') return;

        $el.data('state', 'move');

        var left = parseInt($el.css('left'));
        var page = Math.floor(left/width)*-1 +1;

        if (direction == 'left')
        {
            if (page <= 1) {
                $el.data('state', 'done');
                return;
            }
            left += width;
        }
        else if (direction == 'right')
        {
            if (page >= count) {
                $el.data('state', 'done');
                return;
            }
            left -= width;
        }

        $el.animate({"left": left + "px"}, "slow", function() {
            $el.data('state', 'done');
        });

        page = Math.floor(left/width)*-1 +1;
        $('#'+el_id+'_legend').text( page) ;
    }
    
    

</script>
		<div id="contents_area" class="col-xs-9">
		<%
			String recipemenu = request.getParameter("recipemenu");
			System.out.print(recipemenu);
			if(recipemenu==null) { recipemenu="recipe_group_lately"; }
			else if(recipemenu.equals("recipe_group")) { recipemenu="recipe_group_lately"; }
		%>
		<!-- 여기에서 부터 include 파일 포함 -->	
		<jsp:include page ='<%="../recipe/"+recipemenu+".jsp" %>'></jsp:include>
		<!-- 
		<jsp:include page ="../recipe/recipe_group.jsp"></jsp:include>		
		 -->
		
		
		<!-- 여기까지  include 파일 포함 -->	
		</div>

		<!-- /right_area -->
		<div class="col-xs-12 sub_bg_btm"></div>
	</div>
	<!-- /container -->

</body>
</html>