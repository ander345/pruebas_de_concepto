import { Observable } from 'rxjs';

export class Utils {

    /** Retorna la fecha llevado a Local Date Peru en formato ISO, p.e. 2019-12-07. */
    static getStringLocalDate(fecha: Date): string {
        const tzoffset = new Date().getTimezoneOffset() * 60000;
        const ISOlocalDate = (new Date(fecha.getTime() - tzoffset)).toISOString().substr(0, 10);
        return ISOlocalDate;
    }

    static getImageDataUrlFromLocalPath1(localPath: string): Promise<string> {
        return new Promise((resolve, reject) => {
            let canvas = document.createElement('canvas');
            let img = new Image();
            img.onload = () => {
                canvas.height = img.height;
                canvas.width = img.width;
                canvas.getContext("2d").drawImage(img, 0, 0);
                resolve(canvas.toDataURL('image/png'));
            }
            img.onerror = () => reject('Imagen no disponible')
            img.src = localPath;
        })

    }

    static getImageDataUrlFromLocalPath(localPath: string): Observable<string> {
        return new Observable(observer => {
            let canvas = document.createElement('canvas');
            let img = new Image();
            img.onload = () => {
                canvas.height = img.height;
                canvas.width = img.width;
                canvas.getContext("2d").drawImage(img, 0, 0);
                observer.next(canvas.toDataURL('image/png'));
                observer.complete()

            }
            img.onerror = () => observer.error('Imagen no disponible');
            img.src = localPath;
        })
    }
}
