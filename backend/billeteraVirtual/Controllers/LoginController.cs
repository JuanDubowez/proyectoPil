using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Threading;
using billeteraVirtual.Models;
using billeteraVirtual.Controllers;
using System.Web.Http.Cors;

namespace billeteraVirtual.Controllers
{
    [AllowAnonymous]
    [RoutePrefix("api/login")]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class LoginController : ApiController
    {
        [HttpGet]
        [Route("echoping")]
        public IHttpActionResult EchoPing()
        {
            return Ok(true);
        }

        [HttpGet]
        [Route("echouser")]
        public IHttpActionResult EchoUser()
        {
            var identity = Thread.CurrentPrincipal.Identity;
            return Ok($" IPrincipal-user: {identity.Name} - IsAuthenticated: {identity.IsAuthenticated}");
        }

        [HttpPost]
        [Route("authenticate")]
        public IHttpActionResult Authenticate(LoginRequest login)
        {
            if (login == null)
                throw new HttpResponseException(HttpStatusCode.BadRequest);

            //TODO: This code is only for demo - extract method in new class & validate correctly in your application !!
            var isUserValid = (login.UserName == "fede@gmail.com" && login.Password == "12345678");
            if (isUserValid)
            {
                var rolename = "User";
                var token = TokenGenerator.GenerateTokenJwt(login.UserName, rolename);
                login.Token = token;
                return Ok(login);
            }

            // Unauthorized access 
            return Unauthorized();
        }


    }
}