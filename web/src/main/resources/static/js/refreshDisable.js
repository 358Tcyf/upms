/*阻止事件默认行为*/
function prDefault(evt)
{
    /*IE浏览器*/
    if($.browser.msie)
    {
        evt.keyCode=0;
        evt.returnValue=false;
    }else
    {
        evt.preventDefault();
    }

}

/*禁用页面刷新*/
function noRefresh(event)
{
    /*F5刷新*/
    if(event.keyCode==116)
    {
        prDefault(event);
        return false ;
    }

    /*ctrl+r or ctrl+n 刷新 */
    if(event.ctrlKey && (event.keyCode==78||event.keyCode==82))
    {
        prDefault(event);
        return false;
    }
    /*shitf +f10 右键菜单*/
    if(event.shiftKey && event.keyCode==121)
    {
        prDefault(event);
        return false;
    }
}

(function($){
    $(function(){
        /*禁用页面右键*/
        $(document).bind("contextmenu",function(event){
            return false;
        });
    });

});