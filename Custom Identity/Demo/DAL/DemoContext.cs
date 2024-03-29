namespace Demo.DAL
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using Demo.Entities;

    internal partial class DemoContext : DbContext
    { //internal to make it more secure. cannot access it from the presentation layer. 
        public DemoContext()
            : base("name=DefaultConnection")
        {
        }

        public virtual DbSet<Person> People { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
