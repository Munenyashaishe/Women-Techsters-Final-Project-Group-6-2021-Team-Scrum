using ITIAABackend.API.Dtos.Role;
using ITIAABackend.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITIAABackend.API.Services.Role
{
    public interface IRoleService
    {
        Task<ServiceResponse<List<RoleDto>>> GetAllRoles();
        Task<ServiceResponse<RoleDto>> GetRolesById(int id);
        Task<ServiceResponse<RoleDto>> AddRole(AddRoleDto newRole);
        Task<ServiceResponse<RoleDto>> UpdateRole(RoleDto updatedRole);
        Task<ServiceResponse<RoleDto>> DeleteRole(int id);
    }
}
