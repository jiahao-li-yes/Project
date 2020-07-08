<%@ WebHandler Language="C#" Class="words" %>

using System;
using System.Web;
using System.Xml;

public class words : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string JP_H = context.Request.Params["d1"].ToString();
        XmlDocument xd = new XmlDocument();
        xd.Load(context.Request.PhysicalApplicationPath + "xml/Words.xml");
        XmlNodeList NS = xd.SelectNodes("/Dictionaries/Dictionarie[contains(number,'" + JP_H + "')]");
        string node_text = "";
        foreach (XmlNode N in NS)
        {
            if (JP_H == "" || NS == null)
            {
                context.Response.Write("0");
            }
            else{
                node_text = node_text + N.OuterXml;
            }
        }
        context.Response.Write(node_text);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}