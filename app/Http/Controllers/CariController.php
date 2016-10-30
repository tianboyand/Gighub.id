<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\GenreMusisi;
use App\Grupband;
use App\Genre;
use App\Musician;
use App\Sewa;
use App\Gig;
use DB;

class CariController extends Controller
{
    public function pencarian(Request $request){
        $input = $request->all();

        if($input['tipe'] == 0){
        	if($request->checkbox == null){
        		$ceksewa = Sewa::where('type_sewa', '=', 'hireband')->orwhere('type_sewa', '=', 'bandhire')->get();

        		if(!$ceksewa->isEmpty()){
                    foreach ($ceksewa as $sewa) {
                        if($sewa->type_sewa == 'hireband'){
                            $join = Grupband::join('sewas', 'grupbands.id', '=', 'sewas.object_id')
                                ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                -> where('type_sewa', '=', 'hireband')
                                ->where('grupbands.harga', '=', $input['budget'])
                                ->whereRaw('? NOT between tanggal_mulai and tanggal_selesai', [$input['tanggal']])
                                ->get(['grupbands.*']);
                        }
                        else
                            $join = Grupband::join('sewas', 'grupbands.id', '=', 'sewas.object_id')
                                ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                ->where('type_sewa', '=', 'bandhire')
                                ->where('grupbands.harga', '=', $input['budget'])
                                ->whereRaw('? NOT between tanggal_mulai and tanggal_selesai', [$input['tanggal']])
                                ->get(['grupbands.*']);
                    }

                   // $cek = "SELECT * FROM grupbands INNER JOIN gigs ON sewas.gig_id = gigs.id WHERE sewas.type_sewa = 'hireband' AND gigs."; 

                   //$cek = Grupband::whereNotIn('id', ['sewas.object_id'])->get();

                    $query = "SELECT * FROM grupbands WHERE id NOT IN (SELECT object_id FROM sewas INNER JOIN gigs ON sewas.gig_id = gigs.id WHERE sewas.type_sewa = 'hireband' AND  $input[tanggal] NOT BETWEEN gigs.tanggal_mulai AND gigs.tanggal_selesai)";

                    $cek = DB::select($query);
                                    

        			
        		}
        		else{
        			$join = Grupband::where('harga', $input['budget'])->get();
        		}

                return $cek;

        		//return view('hasilcari')->with('listband',$join);
        	}
        	else{
        		// $ceksewa = Sewa::where('type_sewa', '=', 'hireband')->get();

        		// if(!$ceksewa->isEmpty()){
        		// 	$join = Grupband::join('sewas', 'grupbands.id', '=', 'sewas.object_id')
        		// 				->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
        		// 				->where('sewas.type_sewa', '=', 'hireband')
        		// 				->where('grupbands.harga', '=', $input['budget'])
        		// 				->whereRaw('? NOT between tanggal_mulai and tanggal_selesai', [$input['tanggal']])
        		// 				->get(['grupbands.id']);

        		// 	if(!$join->isEmpty()){
        		// 		foreach ($join as $band) {
        		// 			$joingenre = GenreMusisi::join('genres', 'genre_musisi.genre_id', '=', 'genres.id')
        		// 								->where('genre_musisi.musician_id', $band->id)
        		// 								->get(['genre_musisi.id']);

        		// 			dd($joingenre);
        		// 		}       				
        		// 	}

        		// }
        		// else{
        		// 	$join = Grupband::where('harga', $input['budget'])->get();
        		// }

        		echo "Under Maintenance! Coba pencarian tanpa memilih genre";
        	}
        }
        else
        {
        	if($request->checkbox == null){
	        	$ceksewa = Sewa::where('type_sewa', '=', 'hiremusisi')->get();
	        	
	        	if(!$ceksewa->isEmpty()){
	        		$join = Musician::join('sewas', 'musicians.id', '=', 'sewas.object_id')
	        						->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
	        						->where('sewas.type_sewa', '=', 'hiremusisi')
	        						->where('musicians.harga_sewa', '=', $input['budget'])
	        						->whereRaw('? NOT between tanggal_mulai and tanggal_selesai', [$input['tanggal']])
	        						->get(['musicians.*']);
	        	}else{
	    			$join = Musician::where('harga_sewa', '=', $input['budget'])->get();
	    		}

	    		return view('hasilcarimusisi')->with('listband',$join);

	    	}else{
	    		echo "Under Maintenance! Coba pencarian tanpa memilih genre";
	    	}       

        		
        }

        //dd($input);
    }
}
