using System;
using System.Web;
using System.Web.UI;

namespace Sshop.Controller
{
    public abstract class BaseController
    {
        protected Page CurrentPage { get; private set; }
        protected HttpContext Context { get; private set; }

        protected BaseController(Page page)
        {
            CurrentPage = page;
            Context = HttpContext.Current;
        }

        protected virtual void RedirectToPage(string url)
        {
            CurrentPage.Response.Redirect(url);
        }

        // Сделаем методы public для доступа из страниц
        public virtual void SetTempData(string key, object value)
        {
            // Используем Session для временных данных
            Context.Session[$"TempData_{key}"] = value;
        }

        public virtual T GetTempData<T>(string key)
        {
            var value = Context.Session[$"TempData_{key}"];
            if (value != null)
            {
                // Удаляем после чтения (как TempData в MVC)
                Context.Session.Remove($"TempData_{key}");
                return (T)value;
            }
            return default(T);
        }

        public virtual void SetViewData(string key, object value)
        {
            // Используем Items для данных в рамках одного запроса
            Context.Items[$"ViewData_{key}"] = value;
        }

        public virtual T GetViewData<T>(string key)
        {
            var value = Context.Items[$"ViewData_{key}"];
            return value != null ? (T)value : default(T);
        }

        public virtual void AddModelError(string key, string errorMessage)
        {
            SetTempData($"Error_{key}", errorMessage);
        }

        public virtual bool IsValid()
        {
            // Проверяем, есть ли ошибки
            return GetTempData<string>($"Error_Global") == null;
        }
    }
}