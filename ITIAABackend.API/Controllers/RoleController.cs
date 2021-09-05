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
    [Route("api/[controller]")]
    [ApiController]
    public class RoleController : ControllerBase
    {
        private ItiaaDbContext _dbContext;

            public RoleController(ItiaaDbContext dbContext)
            {
                _dbContext = dbContext;
            }

            [HttpGet("GetRoles")]
            public IActionResult Get()
            {
                try
                {
                    var roles = _dbContext.roles.ToList();

                    if (roles.Count == 0)
                    {
                        return StatusCode(404, "No role found");
                    }
                    return Ok(roles);
                }
                catch (Exception e)
                {
                    return StatusCode(500, "An error occured " + e.Message);
                }

            }

            [HttpPost("CreateRole")]
            public IActionResult Create([FromBody] RoleRequest roleRequest)
            {
                try
                {
                    Roles role = new Roles();
                    role.RoleName = roleRequest.RoleName;
                    role.CreatedAt = roleRequest.CreatedAt;
                    role.UpdatedAt = roleRequest.UpdatedAt;


                    _dbContext.roles.Add(role);
                    _dbContext.SaveChanges();

                    
                    return Ok(role);
                }
                catch (Exception e)
                {
                    return StatusCode(500, "An error occured " + e.Message);
                }

            }

            [HttpPut("UpdateRoles")]
            public IActionResult Update([FromBody] RoleRequest roleRequest)
            {
                try
                {
                    var role = _dbContext.roles.FirstOrDefault(x => x.RoleId == roleRequest.RoleId);
                    if (role == null)
                    {
                        return StatusCode(404, "No customer found");
                    }

                    role.RoleName = roleRequest.RoleName;
                    role.UpdatedAt = roleRequest.UpdatedAt;

                    _dbContext.Entry(role).State = EntityState.Modified;
                    _dbContext.SaveChanges();
                  
                    return Ok(role);
                }
                catch (Exception e)
                {
                    return StatusCode(500, "An error occured " + e.Message);
                }

            }


            [HttpDelete("DeleteUser/{Id}")]
            public IActionResult Delete([FromRoute] int Id)
            {
                try
                {
                    var role = _dbContext.roles.FirstOrDefault(x => x.RoleId == Id);
                    if (role == null)
                    {
                        return StatusCode(404, "No customer found");
                    }


                    _dbContext.Entry(role).State = EntityState.Deleted;
                    _dbContext.SaveChanges();

                   
                    return Ok(role);
                }
                catch (Exception e)
                {
                    return StatusCode(500, "An error occured " + e.Message);
                }
            }
    }
}
