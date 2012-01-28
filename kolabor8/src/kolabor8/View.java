package kolabor8;

import gov.nasa.worldwind.Model;
import gov.nasa.worldwind.WorldWind;
import gov.nasa.worldwind.avlist.AVKey;
import gov.nasa.worldwind.awt.WorldWindowGLCanvas;

import java.awt.BorderLayout;

import org.eclipse.swt.SWT;
import org.eclipse.swt.awt.SWT_AWT;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.ui.part.ViewPart;

public class View extends ViewPart {
	public static final String ID = "kolabor8.view";
	   
	   static final WorldWindowGLCanvas world = new WorldWindowGLCanvas();
	   

	   /**
	    * Initialize the default WW layers
	    */
	   static {
	      initWorldWindLayerModel();
	   }

	   public View() {
	      
	   }
	   
	   /**
	    * This is a callback that will allow us to create the viewer and initialize
	    * it.
	    */
	   public void createPartControl(Composite parent) 
	   {
	      // GUI: an SWT composite on top
	      Composite top = new Composite(parent, SWT.EMBEDDED);
	      top.setLayoutData(new GridData(GridData.FILL_BOTH));
	        
	      // Swing Frame and Panel
	      java.awt.Frame worldFrame = SWT_AWT.new_Frame(top);
	      java.awt.Panel panel = new java.awt.Panel(new java.awt.BorderLayout());
	      
	      worldFrame.add(panel);

	      // Add the WWJ 3D OpenGL Canvas to the Swing Panel
	      panel.add(BorderLayout.CENTER, world);

	      parent.setLayoutData(new GridData(GridData.FILL_BOTH));
	        
	   }

	   /*
	    * Initialize WW model with default layers
	    */
	   static void initWorldWindLayerModel () 
	   {
	      Model m = (Model) WorldWind.createConfigurationComponent(
	            AVKey.MODEL_CLASS_NAME);

	      world.setModel(m);
	   }

	   /**
	    * Passing the focus request to the viewer's control.
	    */
	   public void setFocus() {
	   }
	   
	   public static void repaint() {
	      world.redraw();
	   }

	   @Override
	   public void dispose() {
	      super.dispose();
	   }
}