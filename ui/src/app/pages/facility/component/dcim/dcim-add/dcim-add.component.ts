/**
 * Copyright 2019 VMware, Inc.
 * SPDX-License-Identifier: BSD-2-Clause
*/
import { Component, OnInit } from '@angular/core';
import { DcimService } from '../dcim.service';
import { error } from 'util';
import {Http,RequestOptions } from '@angular/http'
import { Headers, URLSearchParams } from '@angular/http';
import {Router,ActivatedRoute} from '@angular/router';
@Component({
  selector: 'app-dcim-add',
  templateUrl: './dcim-add.component.html',
  styleUrls: ['./dcim-add.component.scss']
})
export class DcimAddComponent implements OnInit {

  constructor(private service:DcimService,private router:Router,private activedRoute:ActivatedRoute) { }

 
  loading:boolean = false;
  dcimType:string = "";
  operatingModals:boolean = false;
  ignoreCertificatesModals:boolean = false;
  tip:string = "";
  verify:boolean = false;
  yes:boolean = false;
  no:boolean = true;
  nlyteAdvanceSettingShow:boolean = false;
  powerIQAdvanceSettingShow:boolean = false;
  commonAdvanceSettingShow:boolean = true;
  dcimConfig={
    type:"",
    name:"",
    description:"",
    serverURL:"",
    userName:"",
    password:"",
    verifyCert:"true",
    advanceSetting:{
      DateFormat:"",
      TimeZone:"",
      PDU_POWER_UNIT:"KW",
      PDU_AMPS_UNIT:"A",
      PDU_VOLT_UNIT:"V",
      TEMPERATURE_UNIT:"C",
      HUMIDITY_UNIT:"%"
    }
  }
  read = "";/** This property is to change the read-only attribute of the password input box*/
  advanceSetting:string = "";
 
  changetype(){

    if(this.dcimConfig.type == "Nlyte"){
      this.nlyteAdvanceSettingShow = true;
      this.powerIQAdvanceSettingShow = false;
    }else if(this.dcimConfig.type == "PowerIQ"){
      this.powerIQAdvanceSettingShow = true;
      this.nlyteAdvanceSettingShow = false;
    }else{
      this.powerIQAdvanceSettingShow = false;
      this.nlyteAdvanceSettingShow = false;
    }
  }

  save(){
     
      this.advanceSetting = JSON.stringify({
        "DateFormat":this.dcimConfig.advanceSetting.DateFormat,
        "TimeZone":this.dcimConfig.advanceSetting.TimeZone,
        "PDU_POWER_UNIT":this.dcimConfig.advanceSetting.PDU_POWER_UNIT,
        "PDU_AMPS_UNIT":this.dcimConfig.advanceSetting.PDU_AMPS_UNIT,
        "PDU_VOLT_UNIT":this.dcimConfig.advanceSetting.PDU_VOLT_UNIT,
        "TEMPERATURE_UNIT":this.dcimConfig.advanceSetting.TEMPERATURE_UNIT,
        "HUMIDITY_UNIT":this.dcimConfig.advanceSetting.HUMIDITY_UNIT
      });

      this.read = "readonly";
      this.loading = true;
      this.service.AddDcimConfig(this.dcimConfig.type,this.dcimConfig.name,this.dcimConfig.description,this.dcimConfig.userName,
        this.dcimConfig.password,this.dcimConfig.serverURL,this.dcimConfig.verifyCert,this.advanceSetting).subscribe(
        (data)=>{
          if(data.status == 201){
            this.loading = false;
            this.router.navigate(["/ui/nav/facility/dcim/dcim-list"]);
          }
        },
        error=>{
          if(error.status == 400 && error.json().errors[0] == "Invalid SSL Certificate"){
            this.loading = false;
            this.verify = true;
            this.ignoreCertificatesModals = true;
            this.tip = error.json().message+". Are you sure you ignore the certificate check?"
          }else if(error.status == 400 && error.json().errors[0] == "Unknown Host"){
            this.loading = false;
            this.operatingModals = true;
            this.tip = error.json().message+". Please check your serverIp. ";
          }else if(error.status == 401){
            this.loading = false;
            this.operatingModals = true;
            this.tip = error.json().message+". Please check your userName or password. ";
          }else{
            this.loading = false;
            this.operatingModals = true;
            this.tip = error.json().message+". Please check your input. ";
          }
        }
      )
  
  }
  Yes(){
    this.ignoreCertificatesModals = false;
    this.read = "";
    if(this.verify){
      this.dcimConfig.verifyCert = "false";
      this.save();
    }
  }
  No(){
    this.read = "";
    this.ignoreCertificatesModals = false;
    this.operatingModals = false;
  }
  cancel(){
    this.router.navigate(["/ui/nav/facility/dcim/dcim-list"]);
  }
  back(){
    this.router.navigate(["/ui/nav/facility/dcim/dcim-list"]);
  }
  ngOnInit() {

  }

}