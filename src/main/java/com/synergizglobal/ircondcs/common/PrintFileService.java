package com.synergizglobal.ircondcs.common;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;

import org.apache.log4j.Logger;

public class PrintFileService extends Thread {

	private static final Logger logger = Logger.getLogger(PrintFileService.class);

	byte[] bytes = null;

	public PrintFileService(byte[] bytes) {
		super("PrintFileService" + Math.random());
		this.bytes = bytes;
		this.start();
	}

	@Override
	public void run() {
		this.print();
	}

	public void print() {
		InputStream is = null;
		try {
			is = new BufferedInputStream(new ByteArrayInputStream(this.bytes));
			PrintService service = PrintServiceLookup.lookupDefaultPrintService();

			DocPrintJob job = service.createPrintJob();
			Doc doc = new SimpleDoc(is, DocFlavor.INPUT_STREAM.AUTOSENSE, null);
			job.print(doc, null);

			Thread.sleep(10000);
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
					logger.error(e);
				}
			}
		}
	}

}