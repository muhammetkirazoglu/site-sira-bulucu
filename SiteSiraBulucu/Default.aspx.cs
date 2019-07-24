using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SiteSiraBulucu
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static int GetPosition(Uri url, string searchTerm)
        {
            //string raw = "http://www.google.com/search?num=100&q={0}&btnG=Search";
            string raw = "https://www.google.com/search?q={0}&num=100";
            string search = string.Format(raw, HttpUtility.UrlEncode(searchTerm));

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(search);
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.ASCII))
                {
                    string html = reader.ReadToEnd();
                    return FindPosition(html, url);
                }
            }
        }


        private static int FindPosition(string html, Uri url)
        {
            // (<a href=\")(\\w+[a-zA-Z0-9.-?=/]*)\" class=l
            // "<div class=\"jfp3ef\"><a href=\"/url?q="
            // <a\\s+(?:[^>]*?\\s+)?href=([\"'])(.*?)\\1
            string lookup = "<div class=\"jfp3ef\"><a\\s+(?:[^>]*?\\s+)?href=([\"'])(.*?)\\1";
            MatchCollection matches = Regex.Matches(html, lookup.ToString());

            if (matches.Count <= 0)
            {
                return 0;
            }
            else
            {
                int sa = 1;
                for (int i = 0; i < matches.Count; i++)
                {
                    string match = matches[i].Groups[2].Value;
                    if (match.Contains(url.Host))
                    {
                        return i + 1;
                    }
                    sa = i;
                }

                if (sa == matches.Count - 1)
                {
                    return 0;
                }
                else
                {
                    return sa;
                }
            }
        }

        protected void btnSiraBul_ServerClick(object sender, EventArgs e)
        {
            if (txtSiteAdi.Value == "" && txtKelime.Value == "")
            {
                //txtZorunluSiteAdi.Attributes.CssStyle.Add("display", "flex");
                //txtZorunluKelime.Attributes.CssStyle.Add("display", "flex");
            }
            else
            {
                if (txtSiteAdi.Value == "")
                {
                    //txtZorunluSiteAdi.Attributes.CssStyle.Add("display", "flex");
                    //txtZorunluKelime.Attributes.CssStyle.Add("display", "none");
                }
                else if (txtKelime.Value == "")
                {
                    //txtZorunluKelime.Attributes.CssStyle.Add("display", "flex");
                    //txtZorunluSiteAdi.Attributes.CssStyle.Add("display", "none");
                }
                else
                {
                    //txtZorunluSiteAdi.Attributes.CssStyle.Add("display", "none");
                    //txtZorunluKelime.Attributes.CssStyle.Add("display", "none");
                    string strUrl = txtSiteAdi.Value;
                    Uri newUri = new Uri(txtSiteAdi.Value);
                    int sira = GetPosition(newUri, txtKelime.Value);
                    lblSonuc.InnerText = sira.ToString() + ". sıradasınız";
                }
            }
        }
    }
}