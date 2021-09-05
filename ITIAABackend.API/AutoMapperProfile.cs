using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ITIAABackend.API.Dtos.Role;
using ITIAABackend.API.Models;

namespace ITIAABackend.API
{
    public class AutoMapperProfile: Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<Roles, RoleDto>();
            CreateMap<AddRoleDto, Roles>();
        }
    }
}
