using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace billeteraVirtual.Models
{
    public class LoginRequest
    {
        private string mail;
        private string contrasena;
        private string token;

        public string UserName { get => mail; set => mail = value; }
        public string Password { get => contrasena; set => contrasena = value; }
        public string Token { get => token; set => token = value; }
    }
}