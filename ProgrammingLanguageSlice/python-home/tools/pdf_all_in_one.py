# -*- coding:utf-8*-
import sys
# reload(sys)
# sys.setdefaultencoding('utf-8')


import os
import os.path
from PyPDF2 import PdfFileReader,PdfFileWriter
import time
time1=time.time()


# 使用os模块walk函数，搜索出某目录下的全部pdf文件
######################获取同一个文件夹下的所有PDF文件名#######################
def getFileName(filepath):
    file_list = []
    for root,dirs,files in os.walk(filepath):
        for filespath in files:
#             print(os.path.join(filespath))
            file_list.append(os.path.join(root))
    for i,_ in enumerate(file_list):
        file_list[i] += "/"+str(i+1)+".pdf"

    return file_list



##########################合并同一个文件夹下所有PDF文件########################
def MergePDF(filepath,outfile):
    output=PdfFileWriter()
    outputPages=0
    pdf_fileName=getFileName(filepath)
    for each in pdf_fileName:
        print(each)
        # 读取源pdf文件
        input = PdfFileReader(open(each, "rb"))

        # 如果pdf文件已经加密，必须首先解密才能使用pyPdf
        if input.isEncrypted == True:
            input.decrypt("map")

        # 获得源pdf文件中页面总数
        pageCount = input.getNumPages()
        outputPages += pageCount
        print(pageCount)

        # 分别将page添加到输出output中
        for iPage in range(0, pageCount):
            output.addPage(input.getPage(iPage))


    print("All Pages Number:"+str(outputPages))
    # 最后写pdf文件
    outputStream=open(filepath+outfile,"wb")
    output.write(outputStream)
    outputStream.close()



if __name__ == '__main__':
    file_dir = r'/home/straydragon/Desktop/pdf' # TODO:修改存放目标pdf文件们的路径
    out="allinone.pdf"
    MergePDF(file_dir,out)
    time2 = time.time()
    print('总共耗时：' + str(time2 - time1) + 's')