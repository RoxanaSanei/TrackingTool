namespace API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CentreContact")]
    public partial class CentreContact
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CentreContact()
        {
            Centres = new HashSet<Centre>();
        }

        [Key]
        public int ContactID { get; set; }

        [Required]
        [StringLength(50)]
        public string ContactTitle { get; set; }

        [Required]
        [StringLength(50)]
        public string ContactFirstName { get; set; }

        [Required]
        [StringLength(50)]
        public string ContactLastName { get; set; }

        [Required]
        [StringLength(50)]
        public string ContactEmail { get; set; }

        [Required]
        [StringLength(50)]
        public string ContactPhone { get; set; }

        [StringLength(50)]
        public string ContactMobile { get; set; }

        public int ContactTypeID { get; set; }

        public virtual ContactType ContactType { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Centre> Centres { get; set; }
    }
}
