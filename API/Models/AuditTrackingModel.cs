namespace API.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class AuditTrackingModel : DbContext
    {
        public AuditTrackingModel()
            : base("name=AuditTrackingModel")
        {
        }

        public virtual DbSet<AddressModel> Addresses { get; set; }
        public virtual DbSet<AuditModel> Audits { get; set; }
        public virtual DbSet<CentreModel> Centres { get; set; }
        public virtual DbSet<CentreContact> CentreContacts { get; set; }
        public virtual DbSet<CentreTestTypeYearlevelModel> CentreTestTypeYearlevels { get; set; }
        public virtual DbSet<ClassModel> Classes { get; set; }
        public virtual DbSet<ClassDeviceType> ClassDeviceTypes { get; set; }
        public virtual DbSet<ClassTestDateModel> ClassTestDates { get; set; }
        public virtual DbSet<ContactTypeModel> ContactTypes { get; set; }
        public virtual DbSet<DeviceTypeModel> DeviceTypes { get; set; }
        public virtual DbSet<InvigilatorModel> Invigilators { get; set; }
        public virtual DbSet<InvigilatorAvailableDate> InvigilatorAvailableDates { get; set; }
        public virtual DbSet<ProjectModel> Projects { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TestTypeModel> TestTypes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AddressModel>()
                .HasMany(e => e.Centres)
                .WithRequired(e => e.Address)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<AddressModel>()
                .HasMany(e => e.Invigilators)
                .WithRequired(e => e.Address)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CentreModel>()
                .Property(e => e.Sector)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<CentreModel>()
                .HasMany(e => e.CentreTestTypeYearlevels)
                .WithRequired(e => e.Centre)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CentreContact>()
                .HasMany(e => e.Centres)
                .WithMany(e => e.CentreContacts)
                .Map(m => m.ToTable("CentreContacts").MapLeftKey("ContactID").MapRightKey("PRACentreID"));

            modelBuilder.Entity<ContactTypeModel>()
                .HasMany(e => e.CentreContacts)
                .WithRequired(e => e.ContactType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DeviceTypeModel>()
                .HasMany(e => e.ClassDeviceTypes)
                .WithRequired(e => e.DeviceType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DeviceTypeModel>()
                .HasMany(e => e.Projects)
                .WithMany(e => e.DeviceTypes)
                .Map(m => m.ToTable("ProjectDeviceTypes").MapLeftKey("DeviceTypeID").MapRightKey("ProjectID"));

            modelBuilder.Entity<InvigilatorModel>()
                .HasMany(e => e.InvigilatorAvailableDates)
                .WithRequired(e => e.Invigilator)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ProjectModel>()
                .HasMany(e => e.Centres)
                .WithRequired(e => e.Project)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TestTypeModel>()
                .HasMany(e => e.CentreTestTypeYearlevels)
                .WithRequired(e => e.TestType)
                .WillCascadeOnDelete(false);

        }
    }
}
