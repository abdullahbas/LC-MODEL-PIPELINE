import os
import pydicom
import argparse
import re
parser = argparse.ArgumentParser(description='Process some integers.')

parser.add_argument ('--inputRaw',help='Path of input Raw MRS ')
parser.add_argument ('--outputRaw',default='default',help='Path of output MRS ')

args=parser.parse_args()

path=re.split(r'/|\\',args.inputRaw)

if args.outputRaw=='default':
    svpath=(path[0]+'\\'+os.path.join(*path[1:-1])+'/anon'+path[-1])
else:
    svpath=args.outputRaw


dataset=pydicom.dcmread(args.inputRaw)

dataset.InstitutionName='anonymous'
dataset.InstitutionAddress='anonymous'
dataset.ReferringPhysicianName='anonymous'
dataset.PhysiciansOfRecord='anonymous'
dataset.NameOfPhysiciansReadingStudy='anonymous'
dataset.AdmittingDiagnosesDescription='anonymous'
dataset.PatientName='anonymous'
dataset.PatientTelephoneNumbers='anonymous'
dataset.PatientAddress='anonymous'
dataset.CurrentPatientLocation='anonymous'
dataset.PatientBirthDate='anonymous'
dataset.PatientSize=None
dataset.PatientWeight=None
dataset.RequestingPhysician='anonymous'
dataset[0x0095,0x10FA].value='anonymous'
#saveDir=(os.path.join(*path[0:-1])+ '\\anon' + path[-1])
#print(saveDir)
print(svpath)
dataset.save_as(svpath)
#dataset.save_as(path[0]+'\\'+os.path.join(*path[1:-1])+'/anon'+path[-1])








