//var one = two = three = null;
var arr = [null,null, null];
$('.list dd').click(function(){
//    console.log(this);
    $(this).addClass('selected').siblings().removeClass('selected');
    
    var index = $(this).parent().parent().index();
    filterFun(this,index);
//    switch(fatherClass){
//        case 'select1':
//            filterFun(this,0);
//            break;
//        case 'select2':
//            filterFun(this,1);
//            break;
//        case 'select3':
//            filterFun(this,2);
//    }
});
function filterFun(ele,num){
    if($(ele).hasClass('select-all')){
        arr[num].remove();
        if($('.result .selected').length == 0){
           $('.select-no').show();
        }
    }else{
    if(arr[num]){
           arr[num].remove();
         }
    arr[num] = $(ele).clone();
    $('.result dl').append(arr[num]).find($('.select-no')).hide();
    }
        }

$('.result').on('click', '.selected', function(){
//    console.log(this); 
    var _this = this;
    arr.forEach(function(ele,index){
        if(ele == null) return;
        if(_this == ele.get(0)){
            $('li:eq('+index+') .select-all').addClass('selected').siblings().removeClass('selected');
        }       
    });
    $(this).remove();
    if($('.result .selected').length == 0){
           $('.select-no').show();
        }
});
//把click绑在了父级result上，当点击到子元素selected时才会触发




//$('.list:eq(0)').css('background','red');
//选择第一个list添加red背景颜色




