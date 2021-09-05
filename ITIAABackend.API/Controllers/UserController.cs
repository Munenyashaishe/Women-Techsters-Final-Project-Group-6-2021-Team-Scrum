using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ITIAABackend.API.Data;
using ITIAABackend.API.Models;
using Microsoft.EntityFrameworkCore;


namespace ITIAABackend.API.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private ItiaaDbContext _dbContext;

    }
}
