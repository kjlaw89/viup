/** \file
 * \brief IUP driver
 *
 * See Copyright Notice in cd.h
 */

#ifndef __CD_IUP_H
#define __CD_IUP_H

#ifdef __cplusplus
extern "C" {
#endif

/* NOTICE: implemented in IUP at the IUPCD library. 
   Only this file is at the CD includes. */

cdContext* cdContextIup(void);
cdContext* cdContextIupDBuffer(void);
cdContext* cdContextIupDBufferRGB(void);

#define CD_IUP           cdContextIup()
#define CD_IUPDBUFFER    cdContextIupDBuffer()
#define CD_IUPDBUFFERRGB cdContextIupDBufferRGB()

#ifdef __cplusplus
}
#endif

#endif
