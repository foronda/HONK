using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HONK_v2.Startup))]
namespace HONK_v2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
