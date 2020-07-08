<%@ WebHandler Language="C#" Class="display" %>

using System;
using System.Web;
using System.Xml;

public class display : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        XmlDocument xd = new XmlDocument();
        xd.Load(context.Request.PhysicalApplicationPath + "xml/Words.xml");

        XmlNodeList NS = xd.SelectNodes("/Dictionaries/*");
        string node_text = "";
        foreach (XmlNode N in NS)
        {
            node_text = node_text + N.OuterXml;
        }
        context.Response.Write(node_text);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}