namespace API.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DBContext : DbContext
    {
        public DBContext()
            : base("name=DBContext")
        {
        }

        public virtual DbSet<Address> Addresses { get; set; }
        public virtual DbSet<Audit> Audits { get; set; }
        public virtual DbSet<Centre> Centres { get; set; }
        public virtual DbSet<CentreContact> CentreContacts { get; set; }
        public virtual DbSet<CentreTestTypeYearlevel> CentreTestTypeYearlevels { get; set; }
        public virtual DbSet<Class> Classes { get; set; }
        public virtual DbSet<ClassDeviceType> ClassDeviceTypes { get; set; }
        public virtual DbSet<ClassTestDate> ClassTestDates { get; set; }
        public virtual DbSet<ContactType> ContactTypes { get; set; }
        public virtual DbSet<DeviceType> DeviceTypes { get; set; }
        public virtual DbSet<Invigilator> Invigilators { get; set; }
        public virtual DbSet<InvigilatorAvailableDate> InvigilatorAvailableDates { get; set; }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<TestType> TestTypes { get; set; }
        public virtual DbSet<Audit_Backup> Audit_Backup { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Address>()
                .HasMany(e => e.Centres)
                .WithRequired(e => e.Address)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Address>()
                .HasMany(e => e.Invigilators)
                .WithRequired(e => e.Address)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Centre>()
                .Property(e => e.Sector)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Centre>()
                .HasMany(e => e.CentreTestTypeYearlevels)
                .WithRequired(e => e.Centre)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CentreContact>()
                .HasMany(e => e.Centres)
                .WithMany(e => e.CentreContacts)
                .Map(m => m.ToTable("CentreContacts").MapLeftKey("ContactID").MapRightKey("PRACentreID"));

            modelBuilder.Entity<ContactType>()
                .HasMany(e => e.CentreContacts)
                .WithRequired(e => e.ContactType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DeviceType>()
                .HasMany(e => e.ClassDeviceTypes)
                .WithRequired(e => e.DeviceType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DeviceType>()
                .HasMany(e => e.Projects)
                .WithMany(e => e.DeviceTypes)
                .Map(m => m.ToTable("ProjectDeviceTypes").MapLeftKey("DeviceTypeID").MapRightKey("ProjectID"));

            modelBuilder.Entity<Invigilator>()
                .HasMany(e => e.InvigilatorAvailableDates)
                .WithRequired(e => e.Invigilator)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Project>()
                .HasMany(e => e.Centres)
                .WithRequired(e => e.Project)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TestType>()
                .HasMany(e => e.CentreTestTypeYearlevels)
                .WithRequired(e => e.TestType)
                .WillCascadeOnDelete(false);
        }
    }
}
