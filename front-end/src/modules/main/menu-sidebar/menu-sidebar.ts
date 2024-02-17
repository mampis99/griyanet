/* eslint-disable prettier/prettier */
import {IUser} from '@/interfaces/user';
import {Component, Vue} from 'vue-facing-decorator';
import MenuItem from '@/components/menu-item/menu-item.vue';
import {Image} from '@profabric/vue-components';
import SidebarSearch from '@/components/sidebar-search/sidebar-search.vue';
import {i18n} from '@/translation';

@Component({
    name: 'app-menu-sidebar',
    components: {
        'app-menu-item': MenuItem,
        'app-sidebar-search': SidebarSearch,
        'pf-image': Image
    }
})
export default class MenuSidebar extends Vue {
    menu = MENU;

    get authentication(): IUser {
        return this.$store.getters['auth/authentication'];
    }

    get sidebarSkin() {
        return this.$store.getters['ui/sidebarSkin'];
    }
}

const MENU: any[] = [];
if(localStorage.level == 1){
    MENU.push(
        {
            name: i18n.global.t('labels.dashboard'),
            path: '/'
        },
        {
            name: 'Paket',
            path: '/paket'
        },
        {
            name: 'Sales',
            path: '/sales'
        },
        {
            name: 'Customer',
            path: '/customer'
        },
        {
            name: 'Laporan',
            path: '/laporan'
        }
    );
}else{
    MENU.push(
        {
            name: i18n.global.t('labels.dashboard'),
            path: '/'
        },
        {
            name: 'Customer',
            path: '/customer'
        }
    );
}