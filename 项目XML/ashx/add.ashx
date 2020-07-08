<%@ WebHandler Language="C#" Class="add" %>

using System;
using System.Web;
using System.Xml;

public class add : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string b_NB = context.Request.Params["d1"].ToString();
        string b_PP = context.Request.Params["d2"].ToString();
        string b_CX = context.Request.Params["d3"].ToString();
        string b_JG = context.Request.Params["d4"].ToString();
        XmlDocument xd = new XmlDocument();
        xd.Load(context.Request.PhysicalApplicationPath + "xml/Words.xml");

        XmlNode N = xd.SelectSingleNode("/Dictionaries/Dictionarie[contains(number,'" + b_NB + "')]");
        if (N == null)
        {
            XmlElement o_NB = xd.CreateElement("number");
            o_NB.InnerText = b_NB;
            XmlElement o_PP = xd.CreateElement("Englishwords");
            o_PP.InnerText = b_PP;
            XmlElement o_CX = xd.CreateElement("Chinesemeaning");
            o_CX.InnerText = b_CX;
            XmlElement o_JG = xd.CreateElement("Examplesentence");
            o_JG.InnerText = b_JG;
            XmlElement o_Dictionarie = xd.CreateElement("Dictionarie");
            o_Dictionarie.AppendChild(o_NB);
            o_Dictionarie.AppendChild(o_PP);
            o_Dictionarie.AppendChild(o_CX);
            o_Dictionarie.AppendChild(o_JG);
            XmlNode root = xd.SelectSingleNode("/Dictionaries");
            root.AppendChild(o_Dictionarie);
            try
            {
                xd.Save(context.Request.PhysicalApplicationPath + "xml/Words.xml");
                context.Response.Write("成功添加赛车！");
            }
            catch
            { context.Response.Write("赛车添加失败！"); }
        }else if(b_NB == ""){
            context.Response.Write("请输入信息！");
        }
        else
        {
            context.Response.Write("汽车已存在！");
        }



    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}