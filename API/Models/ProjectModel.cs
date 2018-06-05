namespace API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Project")]
    public partial class ProjectModel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProjectModel()
        {
            Centres = new HashSet<CentreModel>();
            DeviceTypes = new HashSet<DeviceTypeModel>();
        }

        public int ProjectID { get; set; }

        [Required]
        [StringLength(150)]
        public string ProjectName { get; set; }

        public DateTime TestStartDate { get; set; }

        public DateTime TestEndDate { get; set; }

        [Required]
        [StringLength(50)]
        public string ProjectType { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CentreModel> Centres { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DeviceTypeModel> DeviceTypes { get; set; }
    }
}
