/** \file
 * \brief HSI Color Manipulation
 *
 * See Copyright Notice in im_lib.h
 */

#ifndef __IM_COLORHSI_H
#define __IM_COLORHSI_H

#if	defined(__cplusplus)
extern "C" {
#endif


/** \defgroup hsi HSI Color Coordinate System Conversions
 *
 * \par
 * HSI is just the RGB color space written in a different coordinate system.
 * \par
 * "I" is defined along the cube diagonal. It ranges from 0 (black) to 1 (white). \n
 * HS are the polar coordinates of a plane normal to "I". \n
 * "S" is the normal distance from the diagonal of the RGB cube. It ranges from 0 to 1. \n
 * "H" is the angle starting from the red vector, given in degrees. It ranges from 0 to 360. \n
 * R,G,B when double must be normalized between 0-1.
 * \par
 * This is not a new color space, this is exactly the same gamut as RGB. \n
 * \par
 * See \ref im_colorhsi.h
 * \ingroup color */


/** Converts from RGB to HSI.
 * \ingroup hsi */
void imColorRGB2HSI(double r, double g, double b, double *h, double *s, double *i);

/** Converts from RGB (byte) to HSI.
 * \ingroup hsi */
void imColorRGB2HSIbyte(unsigned char r, unsigned char g, unsigned char b, double *h, double *s, double *i);

/** Converts from HSI to RGB.
 * \ingroup hsi */
void imColorHSI2RGB(double h, double s, double i, double *r, double *g, double *b);

/** Converts from HSI to RGB (byte).
 * \ingroup hsi */
void imColorHSI2RGBbyte(double h, double s, double i, unsigned char *r, unsigned char *g, unsigned char *b);

/** Returns just the hue of the color RGB.
 * \ingroup hsi */
double imColorHue(double R, double G, double B);

/** Returns just the hue of the color RGB (byte).
 * \ingroup hsi */
double imColorHueByte(unsigned char r, unsigned char g, unsigned char b);

/** Returns just the intensity of the color RGB.
 * \ingroup hsi */
double imColorIntensity(double R, double G, double B);

/** Returns just the intensity of the color RGB (byte).
 * \ingroup hsi */
double imColorIntensityByte(unsigned char r, unsigned char g, unsigned char b);

/** Returns just the saturation of the color RGB.\n
 * Here S is not normalized by Smax.
 * \ingroup hsi */
double imColorSaturation(double R, double G, double B);

/** Returns just the saturation of the color RGB (byte).
 * \ingroup hsi */
double imColorSaturationByte(unsigned char r, unsigned char g, unsigned char b);


/***********************************************/

/** Returns I where S is maximum given H (here in radians).
* \ingroup hsi */
double imColorHSI_ImaxS(double h, double cosH, double sinH);


/** Returns maximum S (unnormalized) given I and H (here in radians).
* \ingroup hsi */
double imColorHSI_Smax(double h, double cosH, double sinH, double i);


#if defined(__cplusplus)
}
#endif

#endif
