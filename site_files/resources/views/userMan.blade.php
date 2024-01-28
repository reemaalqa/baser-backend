<html>
    
    <head>
        <title>تعليمات الاستخدام</title>
        
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    </head>
    <body>
           <h3 style="text-align:center;">تطبيق الطالب</h3>
        <div style="display:flex;flex-flow: wrap;text-align:center">
            <?php
            for($i=1;$i<=6;$i++){
                ?>
                <div>
                    
                <img src="{{asset('images/screens2/('.$i.').jpeg')}}" width="250" style="margin:5px 10px;">
                <h4 style="text-align:center;">Step {{$i}}</h4>
                </div>
                <?php
            }
            ?>
        </div>
        <hr/>
        <h3 style="text-align:center;">تطبيق الاستاذ</h3>
        <div style="display:flex;flex-flow: wrap;text-align:center">
            <?php
            for($i=1;$i<=11;$i++){
                ?>
               <div>
                    <img src="{{asset('images/screens/('.$i.').jpeg')}}" width="250" style="margin:5px 10px;">
                <h4 style="text-align:center;">Step {{$i}}</h4>
               </div>
                <?php
            }
            ?>
        </div>
    </body>
</html>