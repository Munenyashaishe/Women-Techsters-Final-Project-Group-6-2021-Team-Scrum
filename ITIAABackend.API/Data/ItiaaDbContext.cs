using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITIAABackend.API.Data
{
    public class ItiaaDbContext :DbContext
    {
        public ItiaaDbContext(DbContextOptions<ItiaaDbContext> options): base(options)
        {

        }

        public DbSet<Roles> roles { get; set; }
    }
}
