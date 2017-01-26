using System.Collections.Generic;
using System.Data.Entity;
using System.Security;
using System.Data.Entity.Migrations;
using System.Linq;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity.EntityFramework;
using HONK_v2.Models;

namespace HONK_v2.Models
{
    public class IdentityDbInitializer : DropCreateDatabaseAlways<ApplicationDbContext>
    {
        protected override void Seed(ApplicationDbContext context)
        {
            //GetRapAgencies().ForEach(c => context.RapAgency.Add(c));
            //GetRapSubAgencies().ForEach(p => context.RapSubAgency.Add(p));
            //GetRapNotificationTypes().ForEach(p => context.RapNotificationType.Add(p));

            SeedRoles(context);
            //SeedRapUsers(context);

            //GetRapNotifications(context).ForEach(n => context.RapNotification.Add(n));
        }
        private static void SeedRoles(ApplicationDbContext context)
        {

            var roleStore = new RoleStore<IdentityRole>(context);
            var roleMgr = new RoleManager<IdentityRole>(roleStore);

            if (!roleMgr.RoleExists("HonkAdmin"))
            {
                IdentityResult IdRoleResult = roleMgr.Create(new IdentityRole { Name = "HonkAdmin" });
            }
            if (!roleMgr.RoleExists("HonkUser"))
            {
                IdentityResult IdRoleResult = roleMgr.Create(new IdentityRole { Name = "HonkAdmin" });
            }
            /*
            if (!roleMgr.Roles.Any(r => r.Name == "RapAdmin"))
            {

                IdRoleResult = roleMgr.Create(new IdentityRole { Name = "canEdit" });
                var store = new RoleStore<IdentityRole>(context);
                var manager = 
                var role = new IdentityRole { Name = "RapAdmin" };

                manager.Create(role);
            }
            if (!context.Roles.Any(r => r.Name == "RapUser"))
            {
                var store = new RoleStore<IdentityRole>(context);
                var manager = new RoleManager<IdentityRole>(store);
                var role = new IdentityRole { Name = "RapUser" };

                manager.Create(role);
            }*/
        }
    }
}