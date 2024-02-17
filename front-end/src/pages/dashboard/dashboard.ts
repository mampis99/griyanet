/* eslint-disable prettier/prettier */
import {Component, Vue} from 'vue-facing-decorator';

@Component({})
export default class Dashboard extends Vue {
    public order: string = '';
    public sales: string = '';
    public paket: string = '';

    public mounted(): void {
        this.getData();
    }

    public getData() {

        const url = 'http://localhost:8000/api/info';
        fetch(url)
            .then(res => res.json())
            .then(res => {
                this.order = res.order;
                this.paket = res.paket;
                this.sales = res.sales;
            });
    }
}
