<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\GenreMusisi;
use App\GenreBand;
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

        //Kalau pilih grupband
        if($input['tipe'] == 0){
            //Kalau Kota gak dipilih
            if($input['kota'] == null){
                //KALAU genre gak dipilih
            	if($request->checkbox == null){
            		$ceksewa = Sewa::where('type_sewa', '=', 'hireband')
                                ->where('status_request', '!=', '1')
                                ->orwhere('type_sewa', '=', 'bandhire')
                                ->where('status_request', '!=', '1')
                                ->get();
                    //Kalau di cek ada grupband di tabel Sewa
            		if(!$ceksewa->isEmpty()){
                        foreach ($ceksewa as $sewa) {
                            if($sewa->type_sewa == 'hireband'){
                                $join = Grupband::join('sewas', 'grupbands.id', '=', 'sewas.object_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    //->where('grupbands.harga', '=', $input['budget'])
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.object_id', '!=', 'grupbands.id')
                                    ->groupBy('grupbands.id')
                                    ->get(['grupbands.*']);
                            }
                            else
                                $join = Grupband::join('sewas', 'grupbands.id', '=', 'sewas.subject_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    //->where('grupbands.harga', '=', $input['budget'])
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.subject_id', '!=', 'grupbands.id')
                                    ->groupBy('grupbands.id')
                                    ->get(['grupbands.*']);
                        }
            			
            		}
                    //Kalau di cek gak ada grupband di tabel Sewa
            		else{
            			$join = Grupband::where('aktif', 'Y')->get();
            		}

            		return view('hasilcari')->with('listband',$join);
                //END gak pilih genre
            	}

                //Kalau Pake Genre
            	else{
                    $ceksewa = Sewa::where('type_sewa', '=', 'hireband')
                                ->where('status_request', '!=', '1')
                                ->orwhere('type_sewa', '=', 'bandhire')
                                ->where('status_request', '!=', '1')
                                ->get();
                    //Kalau di cek ada grupband di tabel Sewa
                    if(!$ceksewa->isEmpty()){
                        foreach ($ceksewa as $sewa) {
                            if($sewa->type_sewa == 'hireband'){
                                $join = Grupband::join('sewas', 'grupbands.id', '=', 'sewas.object_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    //->where('grupbands.harga', '=', $input['budget'])
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.object_id', '!=', 'grupbands.id')
                                    ->groupBy('grupbands.id')
                                    ->get(['grupbands.id']);
                            }
                            else
                                $join = Grupband::join('sewas', 'grupbands.id', '=', 'sewas.subject_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    //->where('grupbands.harga', '=', $input['budget'])
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.subject_id', '!=', 'grupbands.id')
                                    ->groupBy('grupbands.id')
                                    ->get(['grupbands.id']);
                        }

                        foreach ($join as $_join) {
                            $cekgenre = GenreBand::where('band_id', $_join->id)->get(['genre_id']);
                            foreach ($cekgenre as $_cekgenre) {
                                $arrgen = (array) $_cekgenre->genre_id; 
                                $result = array_intersect($request->checkbox, $arrgen);

                                $_cekgenre->hasil = $result;
                            }
                            $_join->genre = $cekgenre;
                        }


                        
                    }
                    //Kalau di cek gak ada grupband di tabel Sewa
                    else{
                        $join = Grupband::where('aktif', 'Y');
                    }

                    foreach ($join as $final) {
                        foreach ($final->genre as $finalgenre) {
                            foreach ($finalgenre->hasil as $temp) {
                                if($temp != null){
                                    $finalid[] = $final->id;
                                }
                            }
                        }
                    }


                    foreach ($finalid as $hasilakhir) {
                        $hasilcariband = Grupband::where('id', $hasilakhir)->where('aktif', 'Y')->first();
                        $idband[] = $hasilcariband;
                    }


                    return view('hasilcari')->with('listband',$idband);
            	}

            //End gak pilih Kota
            }

            //kalau Kota di pilih (GAK NULL)
            else
            {
                if($request->checkbox == null){
                    $ceksewa = Sewa::where('type_sewa', '=', 'hireband')
                                ->where('status_request', '!=', '1')
                                ->orwhere('type_sewa', '=', 'bandhire')
                                ->where('status_request', '!=', '1')
                                ->get();
                    //Kalau di cek ada grupband di tabel Sewa
                    if(!$ceksewa->isEmpty()){
                        foreach ($ceksewa as $sewa) {
                            if($sewa->type_sewa == 'hireband'){
                                $join = Grupband::join('sewas', 'grupbands.id', '=', 'sewas.object_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    //->where('grupbands.harga', '=', $input['budget'])
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.object_id', '!=', 'grupbands.id')
                                    ->where('grupbands.kota', '=', $input['kota'])
                                    ->groupBy('grupbands.id')
                                    ->get(['grupbands.*']);
                            }
                            else
                                $join = Grupband::join('sewas', 'grupbands.id', '=', 'sewas.subject_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    //->where('grupbands.harga', '=', $input['budget'])
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.subject_id', '!=', 'grupbands.id')
                                    ->where('grupbands.kota', '=', $input['kota'])
                                    ->groupBy('grupbands.id')
                                    ->get(['grupbands.*']);
                        }
                        
                    }
                    //Kalau di cek gak ada grupband di tabel Sewa
                    else{
                         $join = Grupband::where('aktif', 'Y');
                    }

                    return view('hasilcari')->with('listband',$join);
                }
                else{
                     $ceksewa = Sewa::where('type_sewa', '=', 'hireband')
                                ->where('status_request', '!=', '1')
                                ->orwhere('type_sewa', '=', 'bandhire')
                                ->where('status_request', '!=', '1')
                                ->get();
                    //Kalau di cek ada grupband di tabel Sewa
                    if(!$ceksewa->isEmpty()){
                        foreach ($ceksewa as $sewa) {
                            if($sewa->type_sewa == 'hireband'){
                                $join = Grupband::join('sewas', 'grupbands.id', '=', 'sewas.object_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    //->where('grupbands.harga', '=', $input['budget'])
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.object_id', '!=', 'grupbands.id')
                                    ->groupBy('grupbands.id')
                                    ->get(['grupbands.id']);
                            }
                            else
                                $join = Grupband::join('sewas', 'grupbands.id', '=', 'sewas.subject_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    //->where('grupbands.harga', '=', $input['budget'])
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.subject_id', '!=', 'grupbands.id')
                                    ->groupBy('grupbands.id')
                                    ->get(['grupbands.id']);
                        }

                        foreach ($join as $_join) {
                            $cekgenre = GenreBand::where('band_id', $_join->id)->get(['genre_id']);
                            foreach ($cekgenre as $_cekgenre) {
                                $arrgen = (array) $_cekgenre->genre_id; 
                                $result = array_intersect($request->checkbox, $arrgen);

                                $_cekgenre->hasil = $result;
                            }
                            $_join->genre = $cekgenre;
                        }


                        
                    }
                    //Kalau di cek gak ada grupband di tabel Sewa
                    else{
                        $join = Grupband::where('aktif', 'Y');
                    }

                    foreach ($join as $final) {
                        foreach ($final->genre as $finalgenre) {
                            foreach ($finalgenre->hasil as $temp) {
                                if($temp != null){
                                    $finalid[] = $final->id;
                                }
                            }
                        }
                    }


                    foreach ($finalid as $hasilakhir) {
                        $hasilcariband = Grupband::where('id', $hasilakhir)->where('aktif', 'Y')->first();
                        $idband[] = $hasilcariband;
                    }


                    return view('hasilcari')->with('listband',$idband);
                }
            //End pilih Kota
            }
        }
        //Kalau Pilih musisi
        else
        {
            //KALAU Kota gak Dipilih
            if($input['kota'] == null){
                //Kalau genre gak dipilih
            	if($request->checkbox == null){        	
    	        	$ceksewa = Sewa::where('type_sewa', '=', 'hiremusisi')
                                ->where('status_request', '!=', '1')
                                ->orwhere('type_sewa', '=', 'musisihire')
                                ->where('status_request', '!=', '1')
                                ->get();

                    if(!$ceksewa->isEmpty()){
                        foreach ($ceksewa as $sewa) {
                            if($sewa->type_sewa == 'hiremusisi'){
                                $join = Musician::join('sewas', 'musicians.id', '=', 'sewas.object_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.object_id', '!=', 'musicians.id')
                                    ->groupBy('musicians.id')
                                    ->get(['musicians.*']);
                            }
                            else{
                                $join = Musician::join('sewas', 'musicians.id', '=', 'sewas.subject_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.subject_id', '!=', 'musicians.id')
                                    ->groupBy('musicians.id')
                                    ->get(['musicians.*']);
                            }
                        }   
                    }
                    
                    return view('hasilcarimusisi')->with('listmusisi',$join);
                //END Genre gak dipilih
                }
                //Kalau Genre dipilih
                else{
                        $ceksewa = Sewa::where('type_sewa', '=', 'hiremusisi')
                                ->where('status_request', '!=', '1')
                                ->orwhere('type_sewa', '=', 'musisihire')
                                ->where('status_request', '!=', '1')
                                ->get();
                        //Kalau di cek ada grupband di tabel Sewa
                        if(!$ceksewa->isEmpty()){
                            foreach ($ceksewa as $sewa) {
                                if($sewa->type_sewa == 'hireband'){
                                    $join = Musician::join('sewas', 'musicians.id', '=', 'sewas.object_id')
                                        ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                        //->where('grupbands.harga', '=', $input['budget'])
                                        ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                        ->where('sewas.object_id', '!=', 'musicians.id')
                                        ->groupBy('musicians.id')
                                        ->get(['musicians.id']);
                                }
                                else
                                    $join = Musician::join('sewas', 'musicians.id', '=', 'sewas.subject_id')
                                        ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                        //->where('grupbands.harga', '=', $input['budget'])
                                        ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                        ->where('sewas.subject_id', '!=', 'musicians.id')
                                        ->groupBy('musicians.id')
                                        ->get(['musicians.id']);
                            }

                            foreach ($join as $_join) {
                                $cekgenre = GenreMusisi::where('musician_id', $_join->id)->get(['genre_id']);
                                foreach ($cekgenre as $_cekgenre) {
                                    $arrgen = (array) $_cekgenre->genre_id; 
                                    $result = array_intersect($request->checkbox, $arrgen);

                                    $_cekgenre->hasil = $result;
                                }
                                $_join->genre = $cekgenre;
                            }


                            
                        }
                        //Kalau di cek gak ada grupband di tabel Sewa
                        else{
                            $join = Musician::where('aktif', 'Y');
                        }

                        foreach ($join as $final) {
                            foreach ($final->genre as $finalgenre) {
                                foreach ($finalgenre->hasil as $temp) {
                                    if($temp != null){
                                        $finalid[] = $final->id;
                                    }
                                }
                            }
                        }


                        foreach ($finalid as $hasilakhir) {
                            $hasilcariband = Musician::where('id', $hasilakhir)->where('aktif', 'Y')->first();
                            $idband[] = $hasilcariband;
                        }


                        return view('hasilcarimusisi')->with('listmusisi',$idband);
                    }
                

            //END KALAU Kota gak dipilih
            }

            //KALAU Kota dipilih
            else{
                //Kalau genre kosong
                if($request->checkbox == null){         
                    $ceksewa = Sewa::where('type_sewa', '=', 'hiremusisi')
                                ->where('status_request', '!=', '1')
                                ->orwhere('type_sewa', '=', 'musisihire')
                                ->where('status_request', '!=', '1')
                                ->get();

                    if(!$ceksewa->isEmpty()){
                        foreach ($ceksewa as $sewa) {
                            if($sewa->type_sewa == 'hiremusisi'){
                                $join = Musician::join('sewas', 'musicians.id', '=', 'sewas.object_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.object_id', '!=', 'musicians.id')
                                    ->where('musicians.kota', '=', $input['kota'])
                                    ->groupBy('musicians.id')
                                    ->get(['musicians.*']);
                            }
                            else{
                                $join = Musician::join('sewas', 'musicians.id', '=', 'sewas.subject_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.subject_id', '!=', 'musicians.id')
                                    ->where('musicians.kota', '=', $input['kota'])
                                    ->groupBy('musicians.id')
                                    ->get(['musicians.*']);
                            }
                        }
                    }
                    return view('hasilcarimusisi')->with('listmusisi',$join);
                //END Kalau genre Kosong
                }
                //Kalau genre dipilih
                else{
                    $ceksewa = Sewa::where('type_sewa', '=', 'hiremusisi')
                                ->where('status_request', '!=', '1')
                                ->orwhere('type_sewa', '=', 'musisihire')
                                ->where('status_request', '!=', '1')
                                ->get();

                    if(!$ceksewa->isEmpty()){
                        foreach ($ceksewa as $sewa) {
                            if($sewa->type_sewa == 'hiremusisi'){
                                $join = Musician::join('sewas', 'musicians.id', '=', 'sewas.object_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.object_id', '!=', 'musicians.id')
                                    ->where('musicians.kota', '=', $input['kota'])
                                    ->groupBy('musicians.id')
                                    ->get(['musicians.*']);
                            }
                            else{
                                $join = Musician::join('sewas', 'musicians.id', '=', 'sewas.subject_id')
                                    ->join('gigs', 'sewas.gig_id', '=', 'gigs.id')
                                    ->whereRaw('? NOT between gigs.tanggal_mulai and gigs.tanggal_selesai', [$input['tanggal']])
                                    ->where('sewas.subject_id', '!=', 'musicians.id')
                                    ->where('musicians.kota', '=', $input['kota'])
                                    ->groupBy('musicians.id')
                                    ->get(['musicians.*']);
                            }
                        }
                        return view('hasilcarimusisi')->with('listmusisi',$join);
                    }

                //END Kalau genre dipilih
                }
            //END KALAU Kota dipilih
            }
        }

    }
}
