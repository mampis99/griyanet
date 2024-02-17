<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use DB;

class DashboardController extends Controller
{
    public function index() {
        $order = DB::table('users')->count();
        $paket = DB::table('paket')->count();
        $sales = DB::table('users')->where('id_level', 2)->count();

        return response()->json([
            'success' => true,
            'message' => 'List Data',
            'order' => $order,
            'paket' => $paket,
            'sales' => $sales 
        ], 200);
    }
}
