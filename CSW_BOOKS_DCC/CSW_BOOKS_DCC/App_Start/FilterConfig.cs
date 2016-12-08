using System.Web;
using System.Web.Mvc;

namespace CSW_BOOKS_DCC
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
