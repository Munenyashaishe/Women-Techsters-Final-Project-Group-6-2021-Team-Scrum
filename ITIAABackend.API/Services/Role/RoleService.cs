using ITIAABackend.API.Dtos.Role;
using ITIAABackend.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.EntityFrameworkCore;

namespace ITIAABackend.API.Services.Role
{
    public class RoleService : IRoleService
    {
        private readonly ItiaaDbContext _dbContext;
        private readonly IMapper _mapper;

        public RoleService(ItiaaDbContext dbContext, IMapper mapper)
        {
           _dbContext = dbContext;
            _mapper = mapper;
        }
        public async Task<ServiceResponse<RoleDto>> AddRole(AddRoleDto newRole)
        {
            var serviceResponse = new ServiceResponse<RoleDto>();
            try
            {
                //Insert into DB
                Roles role = new Roles{
                    RoleName = newRole.RoleName,
                    CreatedAt = newRole.CreatedAt,
                    UpdatedAt = newRole.UpdatedAt
                };
                
                await _dbContext.roles.AddAsync(role);
                await _dbContext.SaveChangesAsync();

                serviceResponse.Data = _mapper.Map<RoleDto>(role);

            }
            catch (Exception e)
            {
                serviceResponse.Success = false;
                serviceResponse.Message = "An error occured: "+e.Message;
                serviceResponse.StatusCode = 500;
            }
           
            return serviceResponse;
        }

        public async Task<ServiceResponse<List<RoleDto>>> GetAllRoles()
        {
            var serviceResponse = new ServiceResponse<List<RoleDto>>();
            try
            {
                var roles =await _dbContext.roles.ToListAsync();

                serviceResponse.Data = _mapper.Map<List<RoleDto>>(roles); 
            }
            catch (Exception e)
            {
                serviceResponse.Success = false;
                serviceResponse.Message = "An error occured: " + e.Message;
                serviceResponse.StatusCode = 500;
            }

            return serviceResponse;
        }

        public async Task<ServiceResponse<RoleDto>> GetRolesById(int id)
        {
            var serviceResponse = new ServiceResponse<RoleDto>();

            try
            {
                var role =await _dbContext.roles.FirstOrDefaultAsync(x => x.RoleId == id);
                if (role == null)
                {
                    serviceResponse.Success = false;
                    serviceResponse.Message = "Not found";
                    serviceResponse.StatusCode = 404;
                    return serviceResponse;
                }

                serviceResponse.Data = _mapper.Map<RoleDto>(role);

            }
            catch (Exception e)
            {
                serviceResponse.Success = false;
                serviceResponse.Message = "An error occured: " + e.Message;
                serviceResponse.StatusCode = 500;
            }

            return serviceResponse;
        }

        public async Task<ServiceResponse<RoleDto>> UpdateRole(RoleDto updatedRole)
        {
            var serviceResponse = new ServiceResponse<RoleDto>();
            try
            {
                var role =await _dbContext.roles.FirstAsync(x => x.RoleId == updatedRole.RoleId);
                if (role == null)
                {
                    serviceResponse.Success = false;
                    serviceResponse.Message = "Not found ";
                    serviceResponse.StatusCode = 404;
                    return serviceResponse;
                }

                role.RoleName = updatedRole.RoleName;
                role.UpdatedAt = updatedRole.UpdatedAt;

                _dbContext.Entry(role).State = EntityState.Modified;
                await _dbContext.SaveChangesAsync();

                serviceResponse.Data = _mapper.Map<RoleDto>(role);
            }
            catch (Exception e)
            {
                serviceResponse.Success = false;
                serviceResponse.Message = "An error occured: " + e.Message;
                serviceResponse.StatusCode = 500;
            }

            return serviceResponse;
        }

        public async Task<ServiceResponse<RoleDto>> DeleteRole(int id)
        {
            var serviceResponse = new ServiceResponse<RoleDto>();
            try
            {
                var role =await _dbContext.roles.FirstAsync(x => x.RoleId == id);
                if (role == null)
                {
                    serviceResponse.Success = false;
                    serviceResponse.Message = "No customer found ";
                    serviceResponse.StatusCode=404;
                }

                _dbContext.Entry(role).State = EntityState.Deleted;
                await _dbContext.SaveChangesAsync();

                serviceResponse.Data = _mapper.Map<RoleDto>(role);
            }
            catch (Exception e)
            {
                serviceResponse.Success = false;
                serviceResponse.Message = "An error occured: " + e.Message; 
                serviceResponse.StatusCode=500;
            }
            return serviceResponse;
        }
    }
}
