//array create table
function array_create_table(TH_array, mark_name_array,Js_obj,div_id)
    //TH_array表头数组,column_arr是二维数组，存放各列数据，div_id是一个div的id属性值
{//初始化记录
    //求列的数目
    var col_num = TH_array.length;
    //求行数
    var rows = Js_obj.find(mark_name_array[0]).length;
    //设置各列记录
    var record = new Array(col_num);
    for (var k = 0; k < col_num; k++)
    { record[k] = new Array(rows);}

    for (C = 0; C < col_num; C++)
    {
        for (R = 0; R < rows; R++) {
            record[C][R] = Js_obj.find(mark_name_array[C])[R].innerHTML;
        }
    }  


    var table_str = "<table border='1'>";
    //生成表头 
    table_str=table_str+"<tr>"
    var column_count = TH_array.length;
    for (var k = 0; k < column_count; k++)
    {
        table_str = table_str + "<th>" + TH_array[k] + "</th>";
    }
    table_str = table_str + "</tr>";
    //生成数据行
    var row_count = rows;
    for (var R = 0; R < row_count; R++)
    {
        table_str = table_str + "<tr>";
        for (var C = 0; C < column_count; C++) {
            table_str=table_str+"<td>"+record[C][R]+"</td>";
        }
        table_str + "</tr>";

    }
    table_str = table_str + "</table>";
    //将构成table的html代码嵌入div
    document.getElementById(div_id).innerHTML = table_str;
}