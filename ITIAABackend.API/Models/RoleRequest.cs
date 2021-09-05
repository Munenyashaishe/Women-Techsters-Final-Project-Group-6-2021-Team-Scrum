using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITIAABackend.API.Models
{
    public class RoleRequest
    {
        private readonly DateTime createdAt = DateTime.Now;

        private readonly DateTime updatedAt = DateTime.Now;

        public int RoleId { get; set; }
        public string RoleName { get; set; }

       
        public DateTime CreatedAt {
            get
            {
                return createdAt;
            }
        }
        public DateTime UpdatedAt {
            get
            {
                return updatedAt;
            }
        }
    }
}
