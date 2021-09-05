using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITIAABackend.API.Dtos.Role
{
    public class AddRoleDto
    {
        private readonly DateTime createdAt = DateTime.Now;

        private readonly DateTime updatedAt = DateTime.Now;

        public string RoleName { get; set; }

        public DateTime CreatedAt
        {
            get
            {
                return createdAt;
            }
        }

        public DateTime UpdatedAt
        {
            get
            {
                return updatedAt;
            }
        }
    }
}
