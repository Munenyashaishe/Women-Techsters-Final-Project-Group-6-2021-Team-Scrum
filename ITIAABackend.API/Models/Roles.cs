using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ITIAABackend.API.Models
{
    public class Roles
    {
        [Key]
        public int RoleId { get; set; }

        [Required]
        [Column(TypeName = "varchar(45)")]
        public string RoleName { get; set; }

        [Required]
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}
