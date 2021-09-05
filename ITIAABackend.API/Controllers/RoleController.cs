using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ITIAABackend.API.Models;
using ITIAABackend.API.Dtos;
using Microsoft.EntityFrameworkCore;
using ITIAABackend.API.Services.Role;
using ITIAABackend.API.Dtos.Role;

namespace ITIAABackend.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoleController : ControllerBase
    {
        private readonly IRoleService _roleService;

        public RoleController(IRoleService roleService)
            {
                _roleService = roleService;
            }

            [HttpGet]
            public async Task<ActionResult> Get()
            {
                 var response= await _roleService.GetAllRoles();

                if (response.StatusCode == 200)
                    {
                        return Ok(response); 
                    }
                return StatusCode(response.StatusCode,response);

            }

        [HttpGet("{id}")]
        public async Task<ActionResult> GetSingle([FromRoute] int id)
        {
            var response = await _roleService.GetRolesById(id);

            if (response.StatusCode == 200)
            {
                return Ok(response);
            }
            return StatusCode(response.StatusCode, response);

        }

            [HttpPost]
            public async Task<IActionResult> Create([FromBody] AddRoleDto roleRequest)
            {
            var response = await _roleService.AddRole(roleRequest);

            if (response.StatusCode == 200)
            {
                return Ok(response);
            }
            return StatusCode(response.StatusCode, response);

            }

            [HttpPut]
            public async Task<ActionResult> Update([FromBody] RoleDto roleRequest)
            {
            var response = await _roleService.UpdateRole(roleRequest);

            if (response.StatusCode == 200)
            {
                return Ok(response);
            }
            return StatusCode(response.StatusCode, response);
        }

            [HttpDelete("{Id}")]
            public async Task<ActionResult> Delete([FromRoute] int Id)
            {
            var response = await _roleService.DeleteRole(Id);

            if (response.StatusCode == 200)
            {
                return Ok(response);
            }
            return StatusCode(response.StatusCode, response);
        }
    }
}
