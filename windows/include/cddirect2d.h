/** \file
 * \brief Direct2D extra drivers.
 *
 * See Copyright Notice in cd.h
 */

#ifndef __CD_DIRECT2D_H
#define __CD_DIRECT2D_H

#ifdef __cplusplus
extern "C" {
#endif


cdContext* cdContextDirect2DNativeWindow(void); /* already double buffered */
cdContext* cdContextDirect2DImage(void);        /* to draw on an image */
cdContext* cdContextDirect2DImageRGB(void);     /* to draw on an RGBA image */
cdContext* cdContextDirect2DDBuffer(void);      /* Not necessary, used to test image drawing */
cdContext* cdContextDirect2DPrinter(void);      /* NOT working */

#define CD_DIRECT2D_NATIVEWINDOW cdContextDirect2DNativeWindow()
#define CD_DIRECT2D_IMAGE cdContextDirect2DImage()
#define CD_DIRECT2D_IMAGERGB cdContextDirect2DImageRGB()
#define CD_DIRECT2D_DBUFFER cdContextDirect2DDBuffer()
#define CD_DIRECT2D_PRINTER cdContextDirect2DPrinter()

void cdInitDirect2D(void);
void cdFinishDirect2D(void);


#ifdef __cplusplus
}
#endif

#endif /* ifndef __CD_DIRECT2D_H */
